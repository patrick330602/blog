---
title: "Linux"
comments: false
shares: false
---
## Automatic Device Mount

Make sure the drive/partition you would like to attach is attached to your system and is turned on.

This guide is referenced from here.

Click on the "Dash" icon on your Unity taskbar (Ubuntu icon) and enter:

disks
Click on "Disks" to open up the program.

Once opened, on its main window, "Disks" graphically shows you your current partition layout.

Now simply choose the NTFS partition that you want to automatically mount on boot, then click on the small gears icon slightly below it. From the menu choose:

‘Edit Mount Options…’
From the next window that is shown, move the slider button to the left, next to the ‘Automatic Mount Options’ label, to gain access to the settings.

Keep the check-marked option ‘Mount at startup’.

Select/Fill the next four options if you wish. "Display Name" is a handy visual aid in Nautilus (file manager).

> If you wish to have the drive as read-only

Add `,ro` to the end of the field that says `nosuid,nodev,nofail,x-gvfs-show` (without a space).
Once done, click on the ‘OK’ button at the bottom. When asked, enter your administrative password.

If you have more than one NTFS partition, then follow the same steps for each one individually.

Restart your computer and enjoy!

## Disable Error Reporting

```sh
sudo service apport stop
sudo gedit /etc/default/apport
```

change `enabled=1` to `enabled=0`

## Fix Time Differences in Ubuntu & Windows
In previous Ubuntu editions, you can edit the config file `/etc/default/rcS` to disable UTC.

In Ubuntu 16.04, open terminal (**Ctrl+Alt+T**) and run the command below instead:

`timedatectl set-local-rtc 1 --adjust-system-clock`

To check out if your system uses Local time, just run:

`timedatectl`

you’ll the local time zone is in use in the Warning section.

## Manually Install Linux kernel

Download Latest Kernel Here:
<http://kernel.ubuntu.com/~kernel-ppa/mainline/>

### x86

Download `headers-all`, `headers-i386`, `image-i386` and install all the deb.

### x64

Download `headers-all`, `headers-amd64`, `image-amd64` and install all the deb.

## Use Pantheon Greeter

- To get pantheon-greeter you'll need to add this PPA, open a terminal and type:
`sudo add-apt-repository ppa:elementary-os/daily && sudo apt-get update && sudo apt-get install pantheon-greeter elementary-theme fonts-open-sans-elementary fonts-raleway-elementary`
- Then open gedit as root, type`gksu gedit /etc/lightdm/lightdm.conf`
- Change the line `greeter-session=` to look like this `greeter-session=pantheon-greeter`
- Log out

## How to display Asian character poroperly in Antergos

I tried multiple ways of installing Chinese font like `ttf-arphic-uming`, `adobe-source-han-sans-otc-fonts` and `noto-fonts-cjk`. This packages solved the problem in system, but not in browsers like Chrome and Firefox. 
Reference: [this post](https://bbs.archlinux.org/viewtopic.php?id=158897)

1. Remove `ttf-google-fonts`(Google Web Font)
2. Install one of them: `ttf-arphic-uming`, `adobe-source-han-sans-otc-fonts`, `noto-fonts-cjk`
3. rebuild the font cache using `sudo fc-cache -f -v` to regenerate font cache. 

To keep it safe, Here is a Ubuntu font config:

| Font Location |     Font  Name |
| :------------ | -------------: |
| Window Titles | Cantarell Bold |
| Interface     |         Ubuntu |
| Documents     |           Sans |
| Monospace     |    Ubuntu Mono |

![Font Setting](/images/antergos-font-settings.png)

## SSH folder permission

 - `.ssh` folder: `700`
 - `*.pub`: `644`
 - pravate keys, config, known_hosts: `600`