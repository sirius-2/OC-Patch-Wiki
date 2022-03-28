# Docs

## 电池
+ 内核扩展  
使用[SMCBatteryManager.kext](https://github.com/acidanthera/VirtualSMC)

+ [概述](battery.md)
   + 正确顺序加载Kext
   + 拆分大于16位的寄存器
   + 修正DSDT错误
   + Mutex置零

## 触摸板
> 注: 驱动触摸板需先驱动电池
+ 内核扩展  
使用[VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)及其卫星(satellite)驱动
+ [概述](i2c.md)
   + 正确顺序加载Kext
   + 启用GPI0
   + 修改触摸板设备代码

### 声卡

> 寻找最适合的layout-id

+ 内核扩展  
使用[AppleALC](https://guthub.com/acidanthera/AppleALC)

+ [概述](i2c.md)

   + 收集声卡文件
   + 解析声卡文件
   + 搜索节点
   + 填入config文件