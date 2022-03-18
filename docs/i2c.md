# 主要
+ 正确顺序加载Kext
+ 启用GPI0
+ 修改触摸板设备(如ETPD、TPXX)代码

## 正确顺序加载kext
+ 根据需要放置核心驱动`VoodooI2C.kext`及卫星驱动(如`VoodooI2CHID.kext`)到`EFI/OC/kexts`
+ 查阅[config-4-I2C+PS2驱动列表](https://github.com/daliansky/OC-little/blob/master/常见驱动加载顺序/config-4-I2C%2BPS2驱动列表.md)，按顺序添加需要的代码到config.plist

## 启用GPI0
找到设备，让其在OSI识别为Darwin时启用该设备，则让它返回`0x0f`  
例子:
```
        Device (GPI0)
        {
            Method (_HID, 0, NotSerialized)
            {

            ...
            ...

            //修改_STA /* 设备状态方法 */
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {

                If ((SBRG == Zero))
                {
                    Return (Zero)
                }

                If ((GPEN == Zero))
                {
                    Return (Zero)
                }
            }

```
修改为：
```
        Device (GPI0)
        {
            Method (_HID, 0, NotSerialized)
            {

            ...
            ...

            //修改_STA /* 设备状态方法 */
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    If ((SBRG == Zero))
                    {
                        Return (Zero)
                    }

                    If ((GPEN == Zero))
                    {
                        Return (Zero)
                    }
                }
            }
```

## 修改触摸板设备
详细： 参阅[VoodooI2C Official docs](https://voodooi2c.github.io)  
> 本文为中断模式教程  
> 若使用轮询模式，则请不要打DSDT补丁，基本无需修改安装VoodooI2CHID

常见设备有：
> 1. Touchpads - TPDX, ELAN, SYNA, CYPR
> 2. Touchscreen - TPLX, ELAN, ETPD, SYNA, ATML
> 3. Sensor Hubs - SHUB

如何寻找触摸板设备，请打开Windows设备管理器，通常为HID设备。确认*BIOS Device name*
> 可以禁用设备驱动以确认是否为该设备，例：ETPD

在DSDT中搜索ETPD。ETPD是你的设备名称，可以找到类似`Device (ETPD)`的入口：
```
    Scope (_SB.PCI0.I2C1)
    {
        Device (ETPD)
        {
        ....
```
查看是否有IOInterruptSpecifiers，通常在SBFI
> 如果没有则可跳过教程尝试安装kexts
```
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x0000005F,
                }
            })
```
`5f`为设备的Interrupt十六进制代码(APIC pin number)，大于`2f`则需做修改确认GPIO pin，填入到SBFG（包含GpioInt的命名块）
> 若小于`2f`，则macOS允许该驱动存在，可跳过教程尝试安装kexts

若无SBFG，则将示例代码填入到Device (ETPD)中
```
    Name (SBFG, ResourceTemplate ()
    {
        GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
            "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0000
            }
    })
```
+ 第一步，查阅([Sunrise Point](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/skylake/include/soc/gpio_defs.h#L43), [Cannon Point-LP](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/cannonlake/include/soc/gpio_defs.h#L42), [Cannon Point-H](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/cannonlake/include/soc/gpio_defs_cnp_h.h#L42))  
搜索你的十六进制代码(如：5f)，得到`GPP_*_IRQ`：
```
/* Group C */

#define GPP_C23_IRQ		0x5f
```
记录C23
+ 第二步，查阅([Sunrise Point](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/skylake/include/soc/gpio_soc_defs.h#L37), [Cannon Point-LP](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/cannonlake/include/soc/gpio_soc_defs.h#L45), [Cannon Point-H](https://github.com/coreboot/coreboot/blob/master/src/soc/intel/cannonlake/include/soc/gpio_soc_defs_cnp_h.h#L40))，搜索C23，得到:
```
/* Group C */
#define GPP_C23			71
```
> 在Cannon Point前的平台，GPIO pin number 和硬件pin number一致  

71则为你的十进制GPIO number，转化为十六进制47，将其填入到SBFG的GpioInt：
```
    Name (SBFG, ResourceTemplate ()
    {
        GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
            "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0047
            }
    })
```
<details>
<summary>Cannon Point和更新平台</summary>
</br>
硬件引脚和GPIO引脚不一致，需做进一步转换得到GPIO pin

查阅<a href="https://github.com/coolstar/VoodooGPIO/blob/master/VoodooGPIO/CannonLake-LP/VoodooGPIOCannonLakeLP.hpp#L366">Cannon Point-LP</a>, <a href="https://github.com/coolstar/VoodooGPIO/blob/master/VoodooGPIO/CannonLake-H/VoodooGPIOCannonLakeH.hpp#L414">Cannon Point-H</a>，得到如

<pre><code>
// 前面查得290
GPP_J3_IRQ = 0x33
GPP_J3 = 290

//转换
// CHIPSET_GPP(num, base, end, gpio_base)
// GPIO pin number = hardware pin number - base + gpis_base
CNL_GPP(3, 287, 298, 352)

290 - 287 (base) + 352 = 355 = 0x163
</code></pre>
355为十进制`GPIO pin number`，转换为十六进制0x163

你可能会得到多组数据，gpio_base为`*_NO_GPIO`无效，测试以得到适合你设备的GPIO pin

---
</details>
最后，确认_CRS方法中返回语句有且只有

```
Return (ConcatenateResTemplate (SBFB, SBFG))
```

到这里DSDT补丁方法完成，编译无错误即可保存。