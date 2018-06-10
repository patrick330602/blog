---
title: How to change multiple emails in Your Repos 如何批量更改commit的邮箱
date: 2016-07-13 11:08:56
tags:
- GitHub
thumbnailImage: /images/github-bug.PNG
---
*Dual Language Article. To change the language, select in TOC at the left.*
*双语文章。若要修改语言，选择左侧的目录进行切换。*

# English

 Recently, I am programming an app on GitHub (Yes, it is WeCode as you have guessed), but I suddenly realized the commits are not properly shown in my dashboard:
<!--more-->

![GitHub Dashboard](/images/github-bug.PNG)

 As a GitHuber, I hate that not all my commits are not shown. As I browse the Git History in Visual Studio, I find that Microsoft changed my email address:

![Well Done, Microsoft](/images/well-done-microsoft.png)

 Well done, Microsoft.

 GitHub actually provides you with a feature to [change author info ](https://help.github.com/articles/changing-author-info/). However, I found it misleading and confusing to the newbies, while only support only one email address. So I decided to write a new instruction for newbies for better understanding.

## Changing author info

To change the name and/or email address recorded in existing commits, you must rewrite the entire history of your Git repository.

> This action is destructive to your repository's history. If you're collaborating on a repository with others, it's considered bad practice to rewrite published history. You should only do this in an emergency.

### Changing the Git history of your repository using a script
We've created a script that will change any commits that previously had the old email address in its author or committer fields to use the correct name and email address.

> Running this script rewrites history for all repository collaborators. After completing these steps, any person with forks or clones must fetch the rewritten history and rebase any local changes into the rewritten history.

Before running this script, you'll need:

- The old email address that appears in the author/committer fields that you want to change
- The correct name and email address that you would like such commits to be attributed to

### Instruction:
1. Open Git Bash.

2. Create a fresh, bare clone of your repository:
   ```shell
   git clone --bare https://github.com/*user*/*repo*.git
   cd *repo*.git
   ```

3. Copy and paste the script in a text editor, replacing the following variables based on the information you gathered:
   - `OLD_EMAIL`
   - `CORRECT_NAME`
   - `CORRECT_EMAIL`

   ```sh
   #!/bin/sh
   # see https://help.github.com/articles/changing-author-info/

   git filter-branch --env-filter '

   OLD_EMAIL=(
       "your-old-email@example.com"
       "another-old-email@example.com"
       "your-git-email@users.noreply.github.com"
   )
   CORRECT_NAME="Your Correct Name"
   CORRECT_EMAIL="your-correct-email@example.com"

   for NEW_EMAIL in ${OLD_EMAIL[@]}; do
       if [ "$GIT_COMMITTER_EMAIL" == "$NEW_EMAIL" ]; then
           export GIT_COMMITTER_NAME="$CORRECT_NAME"
           export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
       fi
       if [ "$GIT_AUTHOR_EMAIL" == "$NEW_EMAIL" ]; then
           export GIT_AUTHOR_NAME="$CORRECT_NAME"
           export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
       fi
   done
   ' --tag-name-filter cat -- --branches --tags
   ```

4. Save the script in the repository folder just created as **git-author-rewrite.sh**.

5. In Git Bash, run following code:
   ```shell
   sh git-author-rewrite.sh
   ```

6. Review the new Git history for errors.

7. Push the corrected history to GitHub:
   ```shell
   git push --force --tags origin 'refs/heads/*'
   ```

8. Clean up the temporary clone:
   ```shell
   cd ..
   rm -rf *repo*.git
   ```

# 中文

最近，我在编写一款挂载在GitHub的程序，但我突然发现我的Git状态好像不太对。。。
<!--more-->

![GitHub状态](/images/github-bug.PNG)

 作为一个GitHub上的码农，这种事很头疼有木有啊！不过我看了下Visual Studio里的Git历史，我才发现这是微软的锅： 

![微软：怎么又是我的锅](/images/well-done-microsoft.png)

 厉害了我的软。

 还好，GitHub 提供了一个叫[修改作者信息](https://help.github.com/articles/changing-author-info/)的功能。但是，这段文字看完后，萌新们可能会一脸蒙逼。而且，这个功能只支持一个邮箱。所以说呢，我就在这儿重写了指引。

## 修改作者信息

为了修改已有的commit作者信息，你需要重写你的Git Repo的全部历史。

> 这一动作将会对你的Repo历史造成毁灭性的修改。如果你与多人协作，这会并不是一个恰当的行为。只有在必须时才进行修改。

### 使用Script修改Git Repo的全部历史
我们创建了一个Script以助于修改旧的作者信息至新的作者信息。

> 运行这段代码会重写所有历史。完成后，其他协作的人必须fetch新的Repo以写入数据。 

在运行前，你需要：

- 准备修改的目标邮箱
- 正确的作者信息

### 步骤:
1. 打开Git Bash.

2. 创建一个全新的bare clone:
   ```shell
   git clone --bare https://github.com/*user*/*repo*.git
   cd *repo*.git
   ```

3. 复制以下的代码到一个编辑器，并修改以下常量：
   - `OLD_EMAIL`准备修改的目标邮箱
   - `CORRECT_NAME`修改后的名字
   - `CORRECT_EMAIL`修改后的邮箱

   ```sh
   #!/bin/sh
   # see https://help.github.com/articles/changing-author-info/

   git filter-branch --env-filter '

   OLD_EMAIL=(
       "your-old-email@example.com"
       "another-old-email@example.com"
       "your-git-email@users.noreply.github.com"
   )
   CORRECT_NAME="Your Correct Name"
   CORRECT_EMAIL="your-correct-email@example.com"

   for NEW_EMAIL in ${OLD_EMAIL[@]}; do
       if [ "$GIT_COMMITTER_EMAIL" == "$NEW_EMAIL" ]; then
           export GIT_COMMITTER_NAME="$CORRECT_NAME"
           export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
       fi
       if [ "$GIT_AUTHOR_EMAIL" == "$NEW_EMAIL" ]; then
           export GIT_AUTHOR_NAME="$CORRECT_NAME"
           export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
       fi
   done
   ' --tag-name-filter cat -- --branches --tags
   ```

4. 在刚刚克隆的文件夹里保存为**git-author-rewrite.sh**。

5. 在Git Bash内运行以下代码：
   ```shell
   sh git-author-rewrite.sh
   ```

6. 常看新的Git历史是否有错误。

7. 推送修改后的历史到GitHub：
   ```shell
   git push --force --tags origin 'refs/heads/*'
   ```

8. 移除这一临时Clone：
   ```shell
   cd ..
   rm -rf *repo*.git
   ```