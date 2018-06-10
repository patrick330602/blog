---
title: Install LDE On windows 10(Updated) 在Windows10上安装Linux桌面环境(更新)
date: 2016-08-23 21:38:08
tags:
- WSL
thumbnailImage: /images/lde-on-win10/main.png
---
*Dual Language Article. To change the language, select in TOC at the left.*
*双语文章。若要修改语言，选择左侧的目录进行切换。*

# English

Previously, I wrote a article about how to use X server, CCSM, Compiz and other components with Bash On Ubuntu On Windows to run Linux desktop environment from Windows desktop. Recently, I find a improved way of installing the LDE. 
<!-- more -->
![Coding In xface4](/images/lde-on-win10/main.png)


> Retrieved from [this post](https://github.com/Microsoft/BashOnWindows/issues/637) in BashOnWindows GitHub site. 

## First things first....

Run following code on Bash On Windows:

```sh
echo "export DISPLAY=:0.0" >> ~/.bashrc
```

And run the following code as root user:

```sh
sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf
```

> it is really important to run the code as root user, otherwise the code won't work

## For Ubuntu:

1. Install VcXsrv and open **XLaunch**. Choose "One large window" with display number as 0.
   Other settings leave as default and finish the configuration.

2. Now open bash, install **Ubuntu Dekstop Environment**, **Unity** and **Compiz Config Settings Manager**:
   ```shell
   sudo apt-get install ubuntu-desktop unity compizconfig-settings-manager
   ```
   and type `ccsm` to open Compiz Configuration Settings Manager.

3. Inside ccsm mouse pointer may be not visible due to icon not loaded. Enable the following plugins.
   [![](/images/lde-on-win10/3.png)](/images/lde-on-win10/3.png)
   [![](/images/lde-on-win10/4.png)](/images/lde-on-win10/4.png)

5. Now close ccsm and open ``compiz`` to start Unity Linux Desktop Environment.   

6. To exit from Ubuntu close bash or kill compiz, the only way of closing Ubuntu.

### For XUbuntu:
1. Install **VcXsrv** and open **XLaunch**. Choose "One large window" or other options you like with display number as 0.
   Other settings leave as default and finish the configuration.

2. Install xorg and xubuntu:
   ```sh
   sudo apt-get install xorg xubuntu-desktop
   ```

   This might take a while to complete.

3. After success installation, open `xfce4-session` to start Xubuntu Desktop Environment.

4. To exit from XUbuntu close bash, the only way of closing xubuntu.

# 中文

> 从BashOnWindows GitHub网站上的[文章](https://github.com/Microsoft/BashOnWindows/issues/637) 进行整理和翻译。

我前面写了一遍如何利用X server, CCSM, Compiz和其他组件，与Bash On Ubuntu On Windows相互配合在Windows 10上直接运行Linux桌面环境。最近，我改进了其中的步骤，所以再发了一篇。

> 除非你是Linux发烧友，不建议使用此Linux桌面环境，因为质量和效果不是很好。推荐使用更轻量的i3wm和[openbox](http://www.patrickwu.cf/2017/03/openbox-tint2-windows10/).

## 首先....

在Bash On Windows运行以下代码:

```sh
echo "export DISPLAY=:0.0" >> ~/.bashrc
```

以Root用户运行以下代码:

```sh
sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf
```

> 一定要以root运行，否则会没有效果

## Unity桌面环境：

1. 安装VcXsrv并打开**XLaunch**。 选择 "One large window" 并在**display number** 输入0，如图：

   [![](/images/lde-on-win10/1.png)](/images/lde-on-win10/1.png)
   一路next下去就行，直到他完成配置

2. 打开Bash On Windows并安装 **ubuntu-desktop**，**unity** 和 **ccsm**：

   ```shell
   sudo apt-get install ubuntu-desktop unity compizconfig-settings-manager
   ```

   输出显示：

   ```shell
   export DISPLAY=localhost:0
   ```

   并打开**ccsm**。
   [![](/images/lde-on-win10/2.png)](/images/lde-on-win10/2.png)

3. **ccsm**中可能显示不出鼠标指针，因为没有加载玩所有内容。如图选择插件。

   [![](/images/lde-on-win10/3.png)](/images/lde-on-win10/3.png)
   [![](/images/lde-on-win10/4.png)](/images/lde-on-win10/4.png)

4. 现在关闭ccsm并打开 **compiz**. 
   [![](/images/lde-on-win10/5.png)](/images/lde-on-win10/5.png)
    Compiz会花些时间载入，稍稍等待下桌面环境就会出现
   [![](/images/lde-on-win10/6.png)](/images/lde-on-win10/6.png)

5. 关闭桌面环境的方法只能是关闭bash窗口，或者杀Compiz进程。

## XFCE桌面环境：

1. 安装VcXsrv并打开**XLaunch**。 选择 "One large window" 并在**display number** 输入0，如图：

   [![](/images/lde-on-win10/1.png)](/images/lde-on-win10/1.png)
   一路next下去就行，直到他完成配置

2. 安装xorg和xubuntu:
   ```sh
   sudo apt-get install xorg xubuntu-desktop
   ```

   此步骤会花上一些时间。

3. 完成后输入 `xfce4-session` 运行Xfce.