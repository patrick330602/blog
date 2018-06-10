---
title: Even More Research on WSL Interoperability
date: 2018-05-14 22:35:30
tags:
- WSL
---

As Windows 10 Linux Subssytem is becoming more and more mature and stable, it is more stable and powerful than ever before. As my own [wslu](https://github.com/patrick330602/wslu) has hit 1.3 already. In order to use it in a more efficient fasion, I extended the research in addition to the previous [article]() I have mentioned. This article will keep updated as time goes by.
<!--more-->

## `powershell.exe` execution time too long

Thanks to [cerebrate](https://github.com/cererate), wslu can now execute `wslusc` faster by boosting the code execution speed in powershell. If we execute powershell.exe directly, code will not be executed directly. Instead, it will try to load a interactive prompt, load profile, and then execute the code. hence, to execute powershell faster, we need to add two parameter: `-NoProfile` and `-NonInteractive`, to stop powershell to load profile and entering interactive prompt.