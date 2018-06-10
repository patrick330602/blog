---
title: .ssh folder permission note
date: 2018-04-20 12:48:50
tags:
- SSH
---
 This is a small article just to remind me about the permission that needed to set up when migrate my files from Windows to Linux because of the bad permission issues.

 - `.ssh` folder: `700`
 - `*.pub`: `644`
 - pravate keys, config, known_hosts: `600`