---
title: "Ubuntu App Backup"
comments: false
shares: false
---

# TL;DR

This is a personal backup for apps installed in my system with Ubuntu GNOME without i3-gaps setup and conky. 

## Post-Installation

* > DO NOT USE THIS ANYMORE
  Install Tigerite Kernel (**Surface Book Drivers**) and ***restart***
  ```shell
  sudo add-apt-repository ppa:tigerite/kernel
  sudo apt-get update
  sudo apt-get install linux-surface
  ```

* Install basic dependencies: git,curl,wget,vim,vim-gnome,screenfetch,python,python3,python-pip,python3-pip,perl

  ```shell
  sudo apt-get install git curl wget
  sudo apt-get install vim vim-gnome
  sudo apt-get install screenfetch
  sudo apt-get install python python3 python-pip python3-pip
  sudo apt-get install perl
  ```
* Unlock root account:

  ```shell
  sudo passwd root
  sudo passwd -u root 
  ```

* Restore scripts and dotfiles:

  ```shell
  git clone https://github.com/patrick330602/dotfiles.git ~
  rm README.md && rm -rf .git
  git clone https://github.com/patrick330602/scriptfiles.git ~/scripts
  ```

* Install vim plugins:
  * Vundle and vim plugins:

    ```shell
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    ```
  * SpaceVim

    ```shell
    curl -sLf https://spacevim.org/install.sh | bash
    ```

* Install zsh and oh-my-zsh:

  ```shell
  sudo apt-get install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```
  And ***restart terminal***.

## General Environments
### Ubuntu GNOME

* Install `sudo apt-get install ubuntu-gnome-desktop`
* Change its DM using `dpkg-reconfigure lightdm` or `dpkg-reconfigure gdm3`

### Themes

#### paper cursor theme and paper icon theme
```shell
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-icon-theme
sudo apt-get install paper-cursor-theme
```
#### Arc gtk theme
```shell
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme
```

#### GRUB Surface Book Theme

```shell
mkdir ~/surface
git clone https://github.com/patrick330602/GRUB-Surface-Book-Theme.git ~/surface
```

Then copy `surface`to `/boot/grub/themes`, and set the theme in Grub Customizer

### Fonts

```shell
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

## Apps

### Internet

#### Google Chrome

**Official Installer**

Download from [here](https://www.google.com/chrome/browser/desktop/index.html).

#### Franz

**Ultimate Social Network Client**

* Download Franz for your distribution from [MeetFranz.com](http://www.meetfranz.com/)
* change into the same directory as the downloaded file, then `sudo tar -xf Franz-linux-x64-0.9.10.tgz -C /opt/franz`
* (optional) `wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png` then `sudo cp franz-icon.png /opt/franz`
* (optional) `sudo touch /usr/share/applications/franz.desktop` then `sudo vim /usr/share/applications/franz.desktop`

paste the following lines into the file, then save the file:
```
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
```
#### Skype 

**New Alpha version of Skype **

Download from [here](https://www.skype.com/en/download-skype/skype-for-linux/downloading-web/?type=weblinux-deb).

#### Corebird

**A nice native Twitter client.**

```shell
sudo add-apt-repository ppa:ubuntuhandbook1/corebird
sudo apt-get update
sudo apt-get install corebird
```

#### FeedReader

**An awesome feed reader with services like Feedly **

```shell
sudo add-apt-repository ppa:eviltwin1/feedreader-stable
sudo apt-get update
sudo apt-get install feedreader
```

### Entertainment

#### Spotify

**Official Spotify Client**

```shell
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
```

#### VLC

**Ultimate media player**

```shell
sudo apt-get update
sudo apt-get install libavcodec-extra-53 vlc browser-plugin-vlc
```

### Tools

#### Dropbox

**Official Dropbox Client**

Download from [Here](https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb).

#### f.lux

**A blue light eliminator **

```shell
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get install fluxgui
```

#### Pushbullet

**3rd-party PushBullet Application**

```shell
sudo add-apt-repository ppa:atareao/pushbullet
sudo apt update
sudo apt install nautilus-pushbullet pushbullet-indicator
```

#### GNOME Tweak Tool

**In-depth System Tweak Tool**

```shell
sudo apt-get install gnome-tweak-tool
```

#### Grub Customizer

**GRUB2 Editor**

```shell
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```

#### Wine && Vineyard

**Win32 Legacy Compatibility Layer**

```shell
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:wine/wine-builds
sudo apt-get update
sudo apt-get install --install-recommends winehq-devel
sudo sh -c 'add-apt-repository ppa:cybolic/vineyard-testing && apt-get update ; apt-get install vineyard'
```

#### Painta

**More User-friendly Than GIMP **

```shell
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install painta
```

#### dict

**A Nice Terminal Dictionary Program**

```shell
sudo apt-get install dict dictd
```

Installing English dictionary databases (*gcide, wn, devil*):

```shell
sudo apt-get install dict-gcide
sudo apt-get install dict-wn
sudo apt-get install dict-devil
```

Installing English Thesaurus database (*moby-thesaurus*):

```shell
sudo apt-get install dict-moby-thesaurus
```

### Security

#### Lantern

**A nice VPN Client**

Downoad [here](https://getlantern.org/).

#### gufw

**Minimal Firewall**

open this [link](apt:gufw) to install.

#### ClamTK

**Anti-virus for Linux**

```shell
sudo apt-get install clamtk
```
#### katoolin

**Kali Linux Tool Installer**

```shell
sudo su
git clone https://github.com/LionSec/katoolin.git && cp katoolin/katoolin.py /usr/bin/katoolin
chmod +x /usr/bin/katoolin
sudo katoolin 
```

***<u>IMPORTANT!</u>***

**<u>REMOVE</u> the repository <u>AFTER</u> Installation of Kali Linux Tool! Otherwise the system will be <u>BROKEN</u>!**

### Development

#### Android Studio

* Install dependencies: `sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386`
* Download from [Android Studio website](https://developer.android.com/studio/index.html).


* Unpack the `.zip` file you downloaded to an appropriate location for your applications, such as within `/usr/local/` for your user profile, or `/opt/` for shared users.
* To launch Android Studio, open a terminal, navigate to the `android-studio/bin/` directory, and execute `studio.sh`.
* Select whether you want to import previous Android Studio settings or not, then click **OK**.
* The Android Studio Setup Wizard guides you though the rest of the setup, which includes downloading Android SDK components that are required for development.

#### Oracle Java Development Kit

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
```

#### Visual Studio Code

Download from [here](https://code.visualstudio.com/download).

##### .NET Core

```shell
 sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177
```

##### PowerShell

1. Download [Here](https://github.com/PowerShell/PowerShell).

2. Then execute the following in the terminal:
   ```shell
   sudo dpkg -i powershell_*
   sudo apt-get install -f
   ```

#### Typora

```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get update
sudo apt-get install typora
```
#### FileZilla

```shell
sudo apt-get install filezilla
```

#### Node.js

```shell
sudo apt-get install nodejs
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
nvm install stable
```

##### Hexo

```shell
npm install -g hexo-cli
```

#### Electron(quick-start)

```shell
git clone https://github.com/electron/electron-quick-start
cd electron-quick-start
npm install && npm start
```