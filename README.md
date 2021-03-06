# OpenCore大纲
[![star](https://gitee.com/Sirius2/OC-Patch-Wiki/badge/star.svg?theme=dark)](https://gitee.com/Sirius2/OC-Patch-Wiki/stargazers) [![fork](https://gitee.com/Sirius2/OC-Patch-Wiki/badge/fork.svg?theme=dark)](https://gitee.com/Sirius2/OC-Patch-Wiki/members)

#### 介绍

尊重作者，对应仓库在GitHub均可找到。*`按适配过程推荐顺序排序`*

## Start
[OpenCorePkg](https://github.com/acidanthera/OpenCorePkg)  
[OcBinaryData](https://github.com/acidanthera/OcBinaryData)

### Offifial Guide  
+ [Dortania Guide](https://dortania.github.io/OpenCore-Install-Guide/)  
+ [宪武OC-Little](https://ocbook.tlhub.cn)  
+ [ACPI Specific - Chapter 19.1](https://gitee.com/Sirius2/OC-Patch-Wiki/blob/master/docs/ACPI_Spec_6_3_A_Oct_6_2020.pdf)
> [简体中文ASL语法](https://ocbook.tlhub.cn/00-总述/00-1-ASL语法基础/) [@athlonreg](https://github.com/athlonreg)

### 核心  
+ [Lilu](https://github.com/acidanthera/Lilu)  
+ [VirtualSMC](https://github.com/acidanthera/VirtualSMC)

### 显卡&Frambuffer
[WhateverGreen](https://github.com/acidanthera/WhateverGreen)

### 机型&EC*
+ [AppleModels](https://github.com/acidanthera/OpenCorePkg/tree/master/AppleModels)  
+ [SMBIOS Support](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html)  
+ [简体中文机型速查表 @daliansky](http://blog.daliansky.net/Intel-core-display-platformID-finishing.html)  
+ [SSDTTime](https://github.com/corpnewt/SSDTTime)  
+ [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)  

> 目前提倡选择机型时，硬件配置与*Apple官方设备*一致*  
> 
> 1.可根据`SSDTTime`的FakeEC选项获取的`SSDT-EC.aml`为安装过程必备  
> 2.推荐为所有适配的机型配备此SSDT表  

### 键盘
[VoodooPS2](https://github.com/acidanthera/VoodooPS2)

### 磁盘
+ [CtlnaAHCIPort](https://github.com/dortania/OpenCore-Install-Guide/blob/master/extra-files/CtlnaAHCIPort.kext.zip): 通常Micron硬盘需要此驱动  
+ [AHCIPortInjector](https://www.insanelymac.com/forum/files/file/436-ahciportinjectorkext/): 在非常传统的磁盘驱动器上可能适用  
> 非必选；如果你的log显示`device is write locked`，推荐选择以上之一

### 网卡
+ Intel无线网卡: [ [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) ] | [ [itlwm](https://github.com/OpenIntelWireless/itlwm) & [HeliPort](https://github.com/OpenIntelWireless/HeliPort) ]  
+ 高通Atheros网卡: [opencore-atheros-kext](https://github.com/FIRSTPLATO/opencore-atheros-kext)

### USB
+ [USBInjectAll](https://github.com/RehabMan/OS-X-USB-Inject-All)  
+ [Hackintool](https://github.com/headkaze/Hackintool)
> 推荐将`USBIjectAll.kext`在安装后替换为纯描述文件的kext以最优化资源

### 电池
+ [SMCBatteryManager](https://github.com/acidanthera/VirtualSMC)  
+ DSDT电池拆分: [ [OC-Little Doc](https://ocbook.tlhub.cn/08-电池补丁/) ] | [ [微臣ccc Doc](./docs/battery.md) ]

### 触摸板
+ [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)  
+ DSDT Patch: [VoodooI2C-Patches](https://github.com/VoodooI2C/VoodooI2C-Patches)  
+ VoodooI2C Doc: [[Official doc](https://voodooi2c.github.io)] | [[微臣ccc Doc](docs/i2c.md)]  
+ IOReg: [IORegistryExplorer](https://github.com/khronokernel/IORegistryClone)

### 声卡
+ [AppleALC](https://github.com/acidanthera/AppleALC)
+ alcid: [Wiki](https://github.com/acidanthera/AppleALC/wiki/Supported-codecs)  
+ [Dortania Guide](https://dortania.github.io/OpenCore-Post-Install/universal/audio.html#finding-your-layout-id)  
+ Codec生成: [PinConfigurator](https://github.com/headkaze/PinConfigurator)  
+ [房大叔的定制教程](https://fangf.cc/2020/03/02/applealc/)

### 蓝牙
+ Intel蓝牙: [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)  
+ 高通Atheros蓝牙: 缺少资料
> [@Bat.bat](https://github.com/williambj1) (因二者不兼容)优先将`IntelBluetoothFirmware.kext`与`itlwm.kext`置于非2.4G环境下工作

## 辅助
+ [ProperTree](https://github.com/corpnewt/ProperTree)  
+ [MaciASL](https://github.com/acidanthera/MaciASL) 
+ [DSDT编辑器(多平台)](https://github.com/ic005k/QtiASL)  
+ ACPI重命名: [HexFiend](https://github.com/HexFiend/HexFiend)  

### DSDT&SSDT
+ [Laptop-DSDT-Patch](https://github.com/RehabMan/Laptop-DSDT-Patch)
> 推荐采用不带DSDT的Hotpatch方式加载ACPI  

### 睡眠问题
参见[睡眠修正方法](https://ocbook.tlhub.cn/11-PNP0C0E睡眠修正方法/)
> 推荐安装后采用[`Hackintool`](https://github.com/headkaze/Hackintool)修复深度预留空间

### 常见驱动加载顺序
宪武[OC-Little](https://github.com/daliansky/OC-little/tree/master/常见驱动加载顺序)
### TroubleShooting
Dortania Guide: [用户空间issue](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/userspace-issues.html)  
+ 磁盘: [SATA在Recovery未显示](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/userspace-issues.html#sata-drives-not-shown-in-diskutility)
+ macOS版本不支持:
> This version of Mac OS X is not supported on this platform  

`boot-args`添加`-no_compat_check`
