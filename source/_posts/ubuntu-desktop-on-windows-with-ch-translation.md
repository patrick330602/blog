---
title: Enable Linux Desktop Environment On Windows 10 在Windows10上启用Linux桌面环境
date: 2016-07-13 21:19:02
tags:
- WSL
chinese: true
thumbnail: /images/wsl/lde-on-win10/main.png
---
*Dual Language Article. To change the language, select in TOC at the left.*
*双语文章。若要修改语言，选择左侧的目录进行切换。*

# English

Right now, using X server, CCSM, Compiz and other components with Bash On Ubuntu On Windows, You can now run Linux desktop environment from Windows desktop.
<!-- more -->
![Coding In xface4](/images/wsl/lde-on-win10/main.png)

> Retrieved from [this post](https://github.com/Microsoft/BashOnWindows/issues/637) in BashOnWindows GitHub site. 

## For Unity:

1. Run following code on Bash On Windows:
   ```sh
   echo "export DISPLAY=:0.0" >> ~/.bashrc
   sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf
   ```

2. Install VcXsrv and open **XLaunch**. Choose "One large window" with display number as 0  like this:

   [![](/images/wsl/lde-on-win10/1.png)](/images/wsl/lde-on-win10/1.png)
   Other settings leave as default and finish the configuration.

3. Now open bash, install **ubuntu-desktop**, **unity** and **ccsm**:
   ```shell
   sudo apt-get install ubuntu-desktop unity compizconfig-settings-manager
   ```
   Export the display:
   ```shell
   export DISPLAY=localhost:0
   ```
   and open **ccsm**.
   [![](/images/wsl/lde-on-win10/2.png)](/images/wsl/lde-on-win10/2.png)

4. Inside ccsm mouse pointer may be not visible due to icon not loaded. Enable the following plugins.
   [![](/images/wsl/lde-on-win10/3.png)](/images/wsl/lde-on-win10/3.png)
   [![](/images/wsl/lde-on-win10/4.png)](/images/wsl/lde-on-win10/4.png)

5. Now close ccsm and open **compiz**. 
   [![](/images/wsl/lde-on-win10/5.png)](/images/wsl/lde-on-win10/5.png)
    Compiz will load and seconds later unity will show up.
   [![](/images/wsl/lde-on-win10/6.png)](/images/wsl/lde-on-win10/6.png)

6. To exit from unity close bash or kill compiz, the only way of closing unity.
### For XFCE:
1. The same configuration for VcXsrv applies here.

2. Install **xfce4-session**:
   ```shell
    sudo apt-get install xfce4-session
   ```
   and run **xfce4-session**.

# 中文

> 从BashOnWindows GitHub网站上的[文章](https://github.com/Microsoft/BashOnWindows/issues/637) 进行整理和翻译。

现在，只要你利用X server, CCSM, Compiz和其他组件，与Bash On Ubuntu On Windows相互配合，你现在可以在Windows 10上直接运行Linux桌面环境.

> 除非你是Linux发烧友，不建议使用此Linux桌面环境。

## Unity桌面环境：

1. 在 Bash On Windows运行以下代码:

   ```sh
   echo "export DISPLAY=:0.0" >> ~/.bashrc
   sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf
   ```

2. 安装VcXsrv并打开**XLaunch**。 选择 "One large window" 并在**display number** 输入0，如图：

   [![](/images/wsl/lde-on-win10/1.png)](/images/wsl/lde-on-win10/1.png)
   一路next下去就行，直到他完成配置

3. 打开Bash On Windows并安装 **ubuntu-desktop**，**unity** 和 **ccsm**：

   ```shell
   sudo apt-get install ubuntu-desktop unity compizconfig-settings-manager
   ```

   输出显示：

   ```shell
   export DISPLAY=localhost:0
   ```

   并打开**ccsm**。
   [![](/images/wsl/lde-on-win10/2.png)](/images/wsl/lde-on-win10/2.png)

4. **ccsm**中可能显示不出鼠标指针，因为没有加载玩所有内容。如图选择插件。

   [![](/images/wsl/lde-on-win10/3.png)](/images/wsl/lde-on-win10/3.png)
   [![](/images/wsl/lde-on-win10/4.png)](/images/wsl/lde-on-win10/4.png)

5. 现在关闭ccsm并打开 **compiz**. 
   [![](/images/wsl/lde-on-win10/5.png)](/images/wsl/lde-on-win10/5.png)
    Compiz会花些时间载入，稍稍等待下桌面环境就会出现
   [![](/images/wsl/lde-on-win10/6.png)](/images/wsl/lde-on-win10/6.png)

6. 关闭桌面环境的方法只能是关闭bash窗口，或者杀Compiz进程。

## XFCE桌面环境：

1. 使用与Unity同样的方法配置VcXsrv。（1-4步）
2. 安装**xfce4-session**：
   ```shell
    sudo apt-get install xfce4-session
   ```
   并运行**xfce4-session**.