# 主要
+ 正确顺序加载Kext
+ 拆分大于16位的寄存器
+ 修正DSDT错误
+ Mutex置零

## 正确顺序加载kext
+ 根据需要放置驱动`SMCBatteryManager.kext`到`EFI/OC/kexts`
+ 查阅[config-1-Lilu-SMC-WEG-ALC驱动列表](https://github.com/daliansky/OC-little/blob/master/常见驱动加载顺序/config-1-Lilu-SMC-WEG-ALC驱动列表.md)，按顺序添加需要的代码到config.plist

## 拆分大于16位的寄存器
DSDT搜索"PNP0C09"，找到EC设备
```
    Scope (_SB.PCI0.LPCB)
    {
        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09"))
            ...
```
拆分时仅需根据OperationRegion，确认相应操作区域，例如：
```
            OperationRegion (SMBX, EmbeddedControl, 0x18, 0x28)
            Field (SMBX, ByteAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                DT2B,   16
            }
```
会找到SMBX中有大于等于16位的寄存器，可以拆分为两个8位寄存器，如:
```
            OperationRegion (SMBX, EmbeddedControl, 0x18, 0x28)
            Field (SMBX, ByteAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                T2B1,8, T2B2,8, //DT2B,   16
            }
```
> 拆分原则是尽量拆分成8位一个寄存器，即32位拆分成四个8位寄存器，64位拆分成8个，128位拆分成16个，256位拆分成32个8位寄存器。  
> 并且尽量保证寄存器DSDT中仅有一个该名称，避免造成代码模糊或冲突  

常用工具：
```
//256位拆分

//BDAT, 256,
BA00,8,BA01,8,BA02,8,BA03,8,
BA04,8,BA05,8,BA06,8,BA07,8,
BA08,8,BA09,8,BA0A,8,BA0B,8,
BA0C,8,BA0D,8,BA0E,8,BA0F,8,
BA10,8,BA11,8,BA12,8,BA13,8,
BA14,8,BA15,8,BA16,8,BA17,8,
BA18,8,BA19,8,BA1A,8,BA1B,8,
BA1C,8,BA1D,8,BA1E,8,BA1F,8,

//BDA2, 256,
BB00,8,BB01,8,BB02,8,BB03,8,
BB04,8,BB05,8,BB06,8,BB07,8,
BB08,8,BB09,8,BB0A,8,BB0B,8,
BB0C,8,BB0D,8,BB0E,8,BB0F,8,
BB10,8,BB11,8,BB12,8,BB13,8,
BB14,8,BB15,8,BB16,8,BB17,8,
BB18,8,BB19,8,BB1A,8,BB1B,8,
BB1C,8,BB1D,8,BB1E,8,BB1F,8,

//使用时直接注释掉原寄存器，再粘贴已拆分代码块
//这样就可以避免想很多名字

```

## 修正DSDT错误
详细： 参阅[ACPI热补丁概述](https://xstar-dev.github.io/hackintosh_advanced/Guide_For_Battery_Hotpatch.html#_16-位拆分写入-w16b)  

首先了解寄存器偏移量算法，如：
```
OperationRegion (ECF3, EmbeddedControl, Zero, 0xFF) // 作用域为 EmbeddedControl，起始偏移量为0，最大长度 0xFF，即 255个字节
Field (ECF3, ByteAcc, Lock, Preserve) // 按字节访问，即每 8 位进 1（1 Byte = 8 Bits）
{
    VCMD,   8, // 0x01
    VDAT,   8, // 0x02
    VSTA,   8, // 0x03
    Offset (0x04),
    AIND,   8, // 0x05
    ANUM,   8, // 0x06
    F1PW,   8, // 0x07
    ...
    Offset (0x60),
    B1CH,   32, // 0x64 = 0x60 + 0x04 (32/8 = 4 to HEX)
    B2CH,   32, // 0x68
    B1MO,   16, // 0x6A
    B2MO,   16, // 0x6C
    B1SN,   16, // 0x6E
    B2SN,   16, // 0x70
    B1DT,   16, // 0x72
    B2DT,   16, // 0x74
    B1CY,   16, // 0x76
    ...
    Offset (0xC2),
    BARC,   16, // 0xC4 = 0xC2 + 0x02 (16/8 = 2 to HEX)
    BADC,   16, // 0xC6
    BADV,   16, // 0xC8
    BDCW,   16, // 0xCA
    BDCL,   16, // 0xCC
    BAFC,   16, // 0xCE
    BAPR,   16, // 0xD0
    B1CR,   16, // 0xD2
    B1AR,   16, // 0xD4
    ...

}
```

了解了就可以开始了，方便我们使用相应函数修复错误

首先复制下面几个方法到DSDT根设备下，即_SB之外的内代码区域
> 声明设备和变量完了的开头位置就可以

```
// Battery Method Start
Method (B1B2, 2, NotSerialized)
{
    Return ((Arg0 | (Arg1 << 0x08)))
}

Method (B1B4, 4, NotSerialized)
{
    Local0 = (Arg2 | (Arg3 << 0x08))
    Local0 = (Arg1 | (Local0 << 0x08))
    Local0 = (Arg0 | (Local0 << 0x08))
    Return (Local0)
}

Method (W16B, 3, NotSerialized)
{
    Arg0 = Arg2
    Arg1 = (Arg2 >> 0x08)
}

Method (RE1B, 1, NotSerialized)
{
    OperationRegion (ERM2, EmbeddedControl, Arg0, One)
    Field (ERM2, ByteAcc, NoLock, Preserve)
    {
        BYTE,   8 
    }

    Return (BYTE) 
}

Method (RECB, 2, Serialized)
{
    Arg1 = ((Arg1 + 0x07) >> 0x03) 
    Name (TEMP, Buffer (Arg1){})
    Arg1 += Arg0
    Local0 = Zero
    While ((Arg0 < Arg1))
    {
        TEMP [Local0] = RE1B (Arg0)
        Arg0++
        Local0++
    }

    Return (TEMP)
}

Method (WE1B, 2, NotSerialized)
{
    OperationRegion (ERM2, EmbeddedControl, Arg0, One)
    Field (ERM2, ByteAcc, NoLock, Preserve)
    {
        BYTE,   8
    }

    BYTE = Arg1
}

Method (WECB, 3, Serialized)
{
    Arg1 = ((Arg1 + 0x07) >> 0x03)
    Name (TEMP, Buffer (Arg1){})
    TEMP = Arg2
    Arg1 += Arg0
    Local0 = Zero
    While ((Arg0 < Arg1))
    {
        WE1B (Arg0, DerefOf (TEMP [Local0]))
        Arg0++
        Local0++
    }
}
// Battery Method End
```

拆分完16位以上寄存器后，寄存器改变了名字，其他引用这些寄存器的代码块肯定会编译出错的

我们的任务就是修复这些错误，修复完成后DSDT电池补丁就基本完成了

在MaciASL中右上角点击编译，会弹出大概20多个（根据修改内容多或少）

> 你可能会使用补丁源的电池补丁，补丁源难免会有错误，所以我提醒。我们修复错误的时候不要盲目修复错误，优先解决多了或者少了括号、花括号的地方，因为这些区域少了或多了编译器就不能正确理解代码内容，很可能在修复到很少错误时，发现修复到这个括号问题的地方，刚修复又多了七八十个错误，这是离谱的。  
> 优先修复括号、花括号多少就可以避免这个问题。或手动拆分16位寄存器，这样就可以保证代码正确

### 读还是写？
开始修复吧，这里我们奠定一个基础：**寄存器的读写是怎么样的？**
> 在后续代码中出现，这些地方会编译出错，我们理解它们是读还是写
1. 寄存器的读通常是引用代码块，如*读取寄存器赋值给其他变量*、*比较相等或大小*

```
//原被拆分的寄存器B1MA
IFMN = B1MA

//原被拆分的寄存器BADC
If ((^^PCI0.LPCB.EC0.BADC < 0x0C80))
```
如果它是32位就是32位读取，如果它是128位就是128位读取

2. 寄存器的写通常是*赋值操作*
```
//原被拆分的寄存器SMW0
//写入操作，将Arg3赋值给SMW0
SMW0 = Arg3

//原被拆分的寄存器SMD0
//写入操作
SMD0 = FB4
```

了解了如何判断，接下来是修复操作，注释掉原代码块，再被引用的地方用上面复制到DSDT的几个函数，根据代码原意，进行修改
### 修改 16 位以上寄存器拆分读取
:large_blue_circle: `B1B2 (Arg0, Arg1)`
> `Arg0`、`Arg1` 为你拆分后的两个 8 位寄存器名字，注意顺序。
```
//拆分BADC为ADC0, ADC1两个寄存器，原语句
// If ((^^PCI0.LPCB.EC0.BADC < 0x0C80))

//修改后
If ((B1B2 (^^PCI0.LPCB.EC0.ADC0, ^^PCI0.LPCB.EC0.ADC1) < 0x0C80))
```

### 修改 16 位寄存器拆分写入
:large_blue_circle: `W16B (Arg0, Arg1，Arg2)`
> `Arg0`、`Arg1` 为你拆分后的两个 8 位寄存器名字，注意顺序。  
> `Arg2` 为被写入的数值或数据对象。
```
//拆分SMW0为MW00, MW01两个寄存器，原语句
// SMW0 = Arg3

//修改后
W16B (MW00, MW01, Arg3)
```

### 修改 32 位寄存器拆分读取
:large_blue_circle: `B1B4 (Arg0, Arg1, Arg2, Arg3)`
> `Arg0`、`Arg1`、`Arg2` 和 `Arg3` 为你拆分后的 4 个 8 位寄存器名字，注意顺序。
```
//原语句
If ((B1CH == 0x0050694C))

//修改后
If ((B1B4 (BC0H, BC1H, BC2H, BC3H) == 0x0050694C))
```

### 修改 32 位以上寄存器读取:
:large_blue_circle: `RECB (Offset, Length)`
> Offset 为原寄存器的偏移量
> Length 为原寄存器的长度
```
//原始Field
Offset (0x8F),
B1MA,   64,

//原语句
IFMN = B1MA

//修改后
IFMN = RECB (0x8F, 0x40)
```
### 修改 32 位以上寄存器写入
:large_blue_circle: `WECB (Offset, Length, Obj)`
> Offset 为原寄存器的偏移量  
> Length 为寄存器的长度  
> Obj 为被写入的值或者数据对象  

```
//原始Field
Field (SMBX, ByteAcc, NoLock, Preserve)
{
    Offset (0x18),
    PRTC,   8,
    SSTS,   5, 
        ,   1, 
    ALFG,   1, 
    CDFG,   1, 
    Offset (0x1A), // 偏移量优先用最近的Offset计算，减少计算量
    ADDR,   8, 
    CMDB,   8,  // 偏移量1C = 0x1A + 0x02
    BDAT,   256, 
    BCNT,   8, 
        ,   1, 
    ALAD,   7, 
    ALD0,   8, 
    ALD1,   8
}


//原语句
BDAT = Local3

//修改后
WECB (0x1C, 0x0100, Local3) // 偏移量1C = 0x1A + 0x02
```

> 添加引用`External (....`修复未知变量错误，通常是FieldUnitObj（略）

## Mutex置零
> 我并未做这步，因Mutex原生已置零，未置零可参考

在当前使用的 DSDT 文件里搜索 Mutex，看出现的几个对象的 SyncLevel 是否为 0

+ XStar-Dev案例  
1. 以 Mutex (BATM, 0x07) 为例，先用`hex friend`搜索BATM得到十六进制代码( hex <-> text)，得到 `42 41 54 4D`，即(42 41 54 4D <-> BATM)  
2. 在前后加上完整定义的十六进制代码，最终得到 `01 42 41 54 4D 07`
3. 其中 `01` 代表 `Mutex`; `07` 则代表 `SyncLevel` 的 `0x07`，
4. 我们的目的是使 Mutex 对象置 0，所以 config 的ACPI更名补丁应填

```
Comment       Set Mutex BATM, 0x07 to 0x0
Find          01 42 41 54 4D 07
Repalce       01 42 41 54 4D 00
```