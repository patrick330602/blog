---
title: How to display Asian character poroperly in Antergos
date: 2017-02-12 17:15:59
tags:
- Arch Linux
- Antergos
thumbnail: /images/antergos-ch.png
---

Antergos is a arch-based Linux that is good for an Arch Linux newbie or a lazy person who do not want to set up Arch Linux by themselves. However, it is always a headache for me to display Chinese font properly, but it always showed that Chinese Charset is not existed in the computer. As a Chinese, my life cannot avoid Chinese.So, I have to solve this problem. 
<!--more-->
I tried multiple ways of installing Chinese font like `ttf-arphic-uming`, `adobe-source-han-sans-otc-fonts` and `noto-fonts-cjk`. This packages solved the problem in system, but not in browsers like Chrome and Firefox. 

As I am about to give up, I see [this post](https://bbs.archlinux.org/viewtopic.php?id=158897). I suddenly realized that I have installed `ttf-google-fonts`(Google Web Font) using Chichi Installer from Antergos. I immediately removed this package, install the `ttf-arphic-uming ` instead, ad rebuild the font cache using `sudo fc-cache -f -v` to regenerate font cache. To keep it safe, I used Ubuntu font config:

| Font Location |     Font  Name |
| :------------ | -------------: |
| Window Titles | Cantarell Bold |
| Interface     |         Ubuntu |
| Documents     |           Sans |
| Monospace     |    Ubuntu Mono |

![Font Setting](/images/antergos-font-settings.png)

After I restart, everything is displayed as it should be.