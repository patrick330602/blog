---
title: "Windows Cheatsheet"
comments: false
shares: false
---

## How to find out which app is using your webcam on Windows

https://www.windowscentral.com/how-see-which-apps-are-using-your-webcam

## Install OS X on Windows 10 using VMware

1. Download [vmware-unlocker](http://www.insanelymac.com/forum/files/file/339-unlocker/), [darwin.iso](https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/8.0.2/3164312/), and Mac OS X Virtual Disk Image(.cdr).
2. Stop service `VMnetDHCP`, `VMUSEArbService`, `VMware NAT Service` and `VMwareHostd`.
3. Install the unlocker using `win-install.cmd` with admin right.
4. Add a virtual machine using the .cdr and choose your version of OSX under **Apple Mac OS X**.
5. modify the vmx file of the virtual machine to add a line of `smc.version = 0` under `smc.present = "TRUE"`.
6. Mount darwin.iso to install VMware Tools on Mac OS X.

+ (OPTIONAL)[enable HiDPI on OS X on VMware](https://www.tonymacx86.com/threads/adding-using-hidpi-custom-resolutions.133254/)

## Adobe CS6 Scaling on High DPI Displays
1. Press Windows Button + R, type “regedit”, and then click OK.
2. Navigate to the following registry subkey:
  `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide`
3. Right-click, select NEW > DWORD (32 bit) Value
4. Type `PreferExternalManifest`, and then press ENTER.
5. Right-click PreferExternalManifest, and then click Modify.
6. Enter Value Data 1 and select Decimal.
7. Click OK. Exit Registry Editor.
8. Create a manifest for apps, for example, After Effects(AfterEX.exe) for AfterEX.exe.manifest with following content(All exe are the same):
```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0" xmlns:asmv3="urn:schemas-microsoft-com:asm.v3">

<dependency>
  <dependentAssembly>
    <assemblyIdentity
      type="win32"
      name="Microsoft.Windows.Common-Controls"
      version="6.0.0.0" processorArchitecture="*"
      publicKeyToken="6595b64144ccf1df"
      language="*">
    </assemblyIdentity>
  </dependentAssembly>
</dependency>

<dependency>
  <dependentAssembly>
    <assemblyIdentity
      type="win32"
      name="Microsoft.VC90.CRT"
      version="9.0.21022.8"
      processorArchitecture="amd64"
      publicKeyToken="1fc8b3b9a1e18e3b">
    </assemblyIdentity>
  </dependentAssembly>
</dependency>

<trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
  <security>
    <requestedPrivileges>
      <requestedExecutionLevel
        level="asInvoker"
        uiAccess="false"/>
    </requestedPrivileges>
  </security>
</trustInfo>

<asmv3:application>
  <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
    <ms_windowsSettings:dpiAware xmlns:ms_windowsSettings="http://schemas.microsoft.com/SMI/2005/WindowsSettings">false</ms_windowsSettings:dpiAware>
  </asmv3:windowsSettings>
</asmv3:application>

</assembly>
``` 


## force Microsoft Edge to start Reading Mode

add `read:` in front of the address to force convert the site to reading mode:

![The Forced Converted Site](/images/edge-reading-mode-1.png)