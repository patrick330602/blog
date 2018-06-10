---
title: Enable touch on Ubuntu on Surface Book 启用Surface Book上Ubuntu的触屏
date: 2017-03-16 13:49:48
tags:
- Ubuntu
- Surface
thumbnail: /images/touch-on-sb.png
---
*Dual Language Article. To change the language, select in the TOC at the left.*
*双语文章。若要修改语言，选择左侧的目录进行切换。*

# English

I used to try to enable the touch screen on Surface Book but failed. Fortunately, someone find out a way to enable touch... on Surface Pro 4. Using his idea with some modification, I successfully enabled touch on Surface Book. Now everything work except hibernating system since it sleeps like dead.
<!--more-->
I will be using /u/cantenna1's kernel in this post.

![](/images/touch-on-sb.png)

> Retrived from [post](https://www.reddit.com/r/SurfaceLinux/comments/4t64zt/getting_the_sp4_running_with_ubuntu_1604/) in Reddit /r/SurfaceLinux and modified

### 1.Shrink the windows partition

Right click Start -> Disk Management. Then right click on the windows partition and go shrink volume and reduce it as much as it will let you (Mine let me shrink to 120 GB).

### 2.Make a bootable Ubuntu usb drive

See <http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows>

### 3.Plug in a usb hub

The keyboard and touch pad won't work for the next few steps so I needed a usb hub to plug in a usb keyboard, mouse and the bootable usb drive. Or if you think you are not tired or you are bored, you can use on screen typing with OnBoard built-in Ubuntu Installer(Settings -> Universal Access -> Typing -> OnScreen Keyboard)

### 4.Boot from usb and install Ubuntu

Turn the surface off and then hold the volume down button while powering on to boot to BIOS. There change the boot order so that usb drives boot before the internal drive.

then you should be able to boot off the Ubuntu usb stick now. Although the original writer chose all the default options and installed alongside windows, I personally suggest using custom drive partition, i.e, separate `/boot` to prevent direct corruption to the system EFI partition.

### 5.Install a patched kernel

You should hopefully now be able to boot to a working Ubuntu, albeit with a ton of issues (no keyboard / touch pad among other things). You now have to update the kernel to one that has support for these features. I personally uses /u/cantenna1's kernel:

This kernel gets the touchscreen working, but the physical buttons will not work and the i915 GuC version used is a little buggy and caused me some issues with external monitors.

Further details on this kernel can be found in this post <https://www.reddit.com/r/SurfaceLinux/comments/4vbzki/androidx86_with_the_new_ipts_driver/d5xs969> and in the comments by /u/cantenna1 and /u/arda_coskunses in this post. Details on the patch for the touch support can be found at <https://github.com/ipts-linux-org/ipts-linux/wiki>. The patch for WIFI is from <https://github.com/matthewwardrop/linux-surfacepro3/blob/master/wifi.patch>.

To install the kernel download this file <https://mega.nz/#!nJJ2DSJZ!4BYSRvzp3hb6NxU5X6_38xFkpuUEmSNvRo2px2TCDqc> and extract its contents. Now open a terminal cd to the location of the files and install them by going

```sh
sudo dpkg -i './linux-headers-4.4.0-rc8touchkernel+_1_amd64.deb'
sudo dpkg -i './linux-image-4.4.0-rc8touchkernel+_1_amd64.deb'
```

### 6.Copy binary files needed by the touch drivers

To work, the touch drivers need some information stored in binaries on your windows partition. You now need to copy them over to the Ubuntu partition and ensure the drivers can find them. 

> Note: If you cannot find the files or have deleted your windows partition you can download them here <https://www.microsoft.com/en-us/download/details.aspx?id=49498>. Select the zip download option and once downloaded you will find the files in the Drivers/System/SurfaceTouchServicingML folder.

To do this first ensure your windows partition is mounted (the easiest way to do this is just to open it in the files browser). Now create a folder named 'itouch' in your root directory and copy the binaries to it

```sh
sudo mkdir /itouch
sudo cp /media/YOUR_USERNAME_HERE/YOUR_DRIVE_NAME_HERE/Windows/INF/PreciseTouch/Intel/* /itouch
```

You now need to create links to the files giving them names that match what the driver will search for

```sh
sudo ln -sf /itouch/SurfaceTouchServicingKernelSKLMSHW0076.bin /itouch/vendor_kernel_skl.bin
sudo ln -sf /itouch/SurfaceTouchServicingSFTConfigMSHW0076.bin /itouch/integ_sft_cfg_skl.bin
sudo ln -sf /itouch/SurfaceTouchServicingDescriptorMSHW0076.bin /itouch/vendor_descriptor.bin
sudo ln -sf /itouch/iaPreciseTouchDescriptor.bin /itouch/integ_descriptor.bin
```

### 7.Change the kernel that boots by default

Everything is now installed, however there is a good chance that your laptop won't boot the right kernel by default. You can select it manually in grub at boot by going Advanced options for Ubuntu -> Ubuntu, with Linux 4.4.0-rc8touchkernel+. To switch out the default you will need to edit grub (I did this with grub-customizer <http://www.howtogeek.com/howto/43471/how-to-configure-the-linux-grub2-boot-menu-the-easy-way/> followed by sudo update-grub)

### 8.Prevent the laptop suspending when the lid closes.

Once suspended it currently cannot wake, to get around this I prevent closing the lid from doing anything. To do this go

```sh
sudo gedit /etc/UPower/UPower.conf
```

and change `IgnoreLid=false` to `IgnoreLid=true`.

For GNOME, you also have to turn off the suspending in the `gnome-tweak-tool`.

# 中文

我以前曾经尝试着启用Surface Book上Ubuntu的触屏但是失败了。幸运的是，有人发现了启用触屏的方法。。。针对于Surface Pro 4的。 但基于他的方法，我进行了一些修改，成功的启用了Surface Book上Ubuntu的触屏。现在除了休眠时会睡死，一切正常。

在此，我会使用/u/cantenna1的kernel。

![](/images/touch-on-sb.png)

> 从Reddit /r/SurfaceLinux上的[文章](https://www.reddit.com/r/SurfaceLinux/comments/4t64zt/getting_the_sp4_running_with_ubuntu_1604/)进行整理，修改和翻译。

### 1.压缩硬盘空间

右键开始菜单->磁盘管理，接着右键C盘分区，选择压缩卷，压缩至你想要用的大小（我的最多可压缩至120GB）。

### 2.创建Ubuntu引导盘

参见<http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows>

### 3.插入外接键鼠（可选）

键盘和触控板在安装和后续步骤是会不可用， 所以你需要插入外接键鼠。如果你闲的蛋疼，你可以使用Ubuntu安装盘内置的OnBoard键盘（设置-> 通用辅助功能-> 打字 -> 屏幕键盘)

### 4.从USB启动并安装Ubuntu

关闭Surface， 按住电源和音量上键进入BIOS。修改启动顺序，使U盘先启动。

然后可以从U盘启动了。虽然原作者在安装时全部选择了默认选项，我还是建议进行自己分区（将`/boot`进行独立分区）以防止破坏EFI分区（不要问我为什么知道的，血的教训啊）。 

### 5.安装Kernel

现在，你可以正常进入Ubuntu了。但是，现在还是有很多问题，比如键鼠不能用。你现在需要使用新的Kernel。我个人使用的是/u/cantenna1的kernel：

这个kernel可以触屏，但是物理键会无法使用。同时，外接显示器会有严重的显示问题。

更加详细的资料片可查看<https://www.reddit.com/r/SurfaceLinux/comments/4vbzki/androidx86_with_the_new_ipts_driver/d5xs969> 和其中/u/cantenna1与/u/arda_coskunses的评论。详细的触屏支持请查看<https://github.com/ipts-linux-org/ipts-linux/wiki>。WiFi驱动来自<https://github.com/matthewwardrop/linux-surfacepro3/blob/master/wifi.patch> 。

安装的话，请下载<https://mega.nz/#!nJJ2DSJZ!4BYSRvzp3hb6NxU5X6_38xFkpuUEmSNvRo2px2TCDqc>并解压文件。 打开终端，cd到文件夹并输入以下指令：

```sh
sudo dpkg -i './linux-headers-4.4.0-rc8touchkernel+_1_amd64.deb'
sudo dpkg -i './linux-image-4.4.0-rc8touchkernel+_1_amd64.deb'
```

### 6.拷贝触屏驱动

要让触屏工作，我们需要Windows分区的触屏驱动。我们需要将这些文件从Windows分区拷贝到Ubuntu分区，以保证可以找到驱动。

> 注：如果你找不到或者删掉了Windows分区的话你可以从此下载<https://www.microsoft.com/en-us/download/details.aspx?id=49498>。选择zip格式，然后你可以在Drivers/System/SurfaceTouchServicingML下找到触屏驱动。

首先确保你的Windows分区已经挂载（最简单的方法是在资源管理器里直接挂载）。现在在根目录创建名为itouch的文件夹，并将驱动拷贝进去。

```sh
sudo mkdir /itouch
sudo cp /media/用户名/磁盘名/Windows/INF/PreciseTouch/Intel/* /itouch
```
你现在需要创建链接使驱动可以被搜索到。

```sh
sudo ln -sf /itouch/SurfaceTouchServicingKernelSKLMSHW0076.bin /itouch/vendor_kernel_skl.bin
sudo ln -sf /itouch/SurfaceTouchServicingSFTConfigMSHW0076.bin /itouch/integ_sft_cfg_skl.bin
sudo ln -sf /itouch/SurfaceTouchServicingDescriptorMSHW0076.bin /itouch/vendor_descriptor.bin
sudo ln -sf /itouch/iaPreciseTouchDescriptor.bin /itouch/integ_descriptor.bin
```

### 7.修改默认Kernel

所有驱动已经安装完，但是系统不一定会启动到正确的Kernel。你可以在启动时在grub手动选择Advanced options for Ubuntu -> Ubuntu, with Linux 4.4.0-rc8touchkernel+。要改变默认的Kernel你需要修改grub（我用的是-customizer<http://www.howtogeek.com/howto/43471/how-to-configure-the-linux-grub2-boot-menu-the-easy-way/>)。

### 8.防止自动休眠

一旦休眠，你的电脑会睡的死死的。要防止盖上后自动休眠，输入以下指令：

```sh
sudo gedit /etc/UPower/UPower.conf
```

然后把`IgnoreLid=false`改成`IgnoreLid=true`。

对于Gnome，你需要在`gnome-tweak-tool`关闭休眠。