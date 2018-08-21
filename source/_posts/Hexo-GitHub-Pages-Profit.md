---
title: Hexo + GitHub Pages + ??? = Profit
date: 2017-06-27 09:11:10
tags:
- Hexo
thumbnail: /images/hg/0.png
---
*Dual Language Article. To change the language, select in TOC at the left.*
*双语文章。若要修改语言，选择左侧的目录进行切换。*

# 中文

## 前言

Hexo是一个简单易懂(呸)的静态Blog生成器，他与GitHub Pages配合，可以说是非常完美的免费Blog平台。但是，对于小白来说，Hexo的使用和配置还是很复杂，所以特此在前面声明：

1. Hexo非常折腾，需要耐心；
2. 也需要一定的学习能力和钻研精神；
3. 懂一些网页基础知识就行，但其实不懂也重要。
<!--more-->
## 创建GitHub Pages

1. 打开<github.com>，点击右上角的加号，选择“new repository”；

![](/images/hg/1.png)

2. 在 Repository Name里输入“你的用户名.github.io”,如你的用户名是`dalao`，那么你应该输入dalao.github.io，然后勾选“Initialize this repository with a README”，点击“Create Repository”；

![](/images/hg/2.png)

3. 此时你的Repository已经创建好并弹出Repo的界面了。选择“Settings”，取消勾选“Feature”下的“Wikis”，“Issues”和“Projects”。

![](/images/hg/3.png)

至此，GitHub Pages就创建完毕了。

## 安装Hexo

1. 下载[GitHub客户端](https://desktop.github.com)并安装和登陆你的账号；

![](/images/hg/4.png)

2. 前往[NodeJS官网](https://nodejs.org/),下载Current或是LTS版都可以，然后打开安装包安装；

![](/images/hg/5.png)

3. 安装好后，用管理员身份打开CMD或者Powershell，输入`npm install -g hexo-cli`,耐心等待完成；
4. 完成后，在你喜欢的地方新建一个文件夹作为网站基础，并复制这个文件夹地址（如C:\Files\Desktop\website）；
5. 用管理员身份打开CMD或Powershell, 输入` cd "文件夹地址"`，回车，然后再输入`hexo init`来创建网站，这一步要耐心等待，可能有些花时间。完成后输入`npm install`来完成安装。

![](/images/hg/6.png)

## Hexo架构

新建完成后，指定文件夹的目录如下：

```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```

### _config.yml
网站的**配置**信息，您可以在此配置大部分的参数。

### package.json
应用程序的信息。EJS, Stylus 和 Markdown renderer 已默认安装，您可以自由移除。
```json
package.json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "hexo": {
    "version": ""
  },
  "dependencies": {
    "hexo": "^3.0.0",
    "hexo-generator-archive": "^0.1.0",
    "hexo-generator-category": "^0.1.0",
    "hexo-generator-index": "^0.1.0",
    "hexo-generator-tag": "^0.1.0",
    "hexo-renderer-ejs": "^0.1.0",
    "hexo-renderer-stylus": "^0.2.0",
    "hexo-renderer-marked": "^0.2.4",
    "hexo-server": "^0.1.2"
  }
}
```

### scaffolds
模版 文件夹。当您新建文章时，Hexo 会根据 scaffold 来建立文件。

Hexo的模板是指在新建的markdown文件中默认填充的内容。例如，如果您修改scaffold/post.md中的Front-matter内容，那么每次新建一篇文章时都会包含这个修改。

### source
资源文件夹是存放用户资源的地方。除 _posts 文件夹之外，开头命名为 _ (下划线)的文件 / 文件夹和隐藏的文件将会被忽略。Markdown 和 HTML 文件会被解析并放到 public 文件夹，而其他文件会被拷贝过去。

### themes
主题 文件夹。Hexo 会根据主题来生成静态页面。

## 配置你的Hexo网站

您可以在 `_config.yml` 中修改大部份的配置。

### 网站

| 参数            | 描述                                       |
| ------------- | ---------------------------------------- |
| `title`       | 网站标题                                     |
| `subtitle`    | 网站副标题                                    |
| `description` | 网站描述                                     |
| `author`      | 您的名字                                     |
| `language`    | 网站使用的语言                                  |
| `timezone`    | 网站时区。Hexo 默认使用您电脑的时区。[时区列表](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)。比如说：`America/New_York`, `Japan`, 和 `UTC` 。 |

其中，`description`主要用于SEO，告诉搜索引擎一个关于您站点的简单描述，通常建议在其中包含您网站的关键词。`author`参数用于主题显示文章的作者。

### 网址

| 参数                   | 描述                                       | 默认值                         |
| -------------------- | ---------------------------------------- | --------------------------- |
| `url`                | 网址（输入你的github.io地址，就是\*\*\*\*.github.io  |                             |
| `root`               | 网站根目录                                    |                             |
| `permalink`          | 文章的 [永久链接](https://hexo.io/zh-cn/docs/permalinks.html) 格式 | `:year/:month/:day/:title/` |
| `permalink_defaults` | 永久链接中各部分的默认值                             |                             |

> 网站存放在子目录
>
> 如果您的网站存放在子目录中，例如 `http://yoursite.com/blog`，则请将您的 `url` 设为 `http://yoursite.com/blog` 并把 `root` 设为 `/blog/`。

### 目录

| 参数             | 描述                                       | 默认值              |
| -------------- | ---------------------------------------- | ---------------- |
| `source_dir`   | 资源文件夹，这个文件夹用来存放内容。                       | `source`         |
| `public_dir`   | 公共文件夹，这个文件夹用于存放生成的站点文件。                  | `public`         |
| `tag_dir`      | 标签文件夹                                    | `tags`           |
| `archive_dir`  | 归档文件夹                                    | `archives`       |
| `category_dir` | 分类文件夹                                    | `categories`     |
| `code_dir`     | Include code 文件夹                         | `downloads/code` |
| `i18n_dir`     | 国际化（i18n）文件夹                             | `:lang`          |
| `skip_render`  | 跳过指定文件的渲染，您可使用 [glob 表达式](https://github.com/isaacs/node-glob)来匹配路径。 |                  |

> 提示
>
> 如果您刚刚开始接触Hexo，通常没有必要修改这一部分的值。

### 文章

| 参数                  | 描述                                       | 默认值       |
| ------------------- | ---------------------------------------- | --------- |
| `new_post_name`     | 新文章的文件名称                                 | :title.md |
| `default_layout`    | 预设布局                                     | post      |
| `auto_spacing`      | 在中文和英文之间加入空格                             | false     |
| `titlecase`         | 把标题转换为 title case                        | false     |
| `external_link`     | 在新标签中打开链接                                | true      |
| `filename_case`     | 把文件名称转换为 (1) 小写或 (2) 大写                  | 0         |
| `render_drafts`     | 显示草稿                                     | false     |
| `post_asset_folder` | 启动 [Asset 文件夹](https://hexo.io/zh-cn/docs/asset-folders.html) | false     |
| `relative_link`     | 把链接改为与根目录的相对位址                           | false     |
| `future`            | 显示未来的文章                                  | true      |
| `highlight`         | 代码块的设置                                   |           |

> 相对地址
>
> 默认情况下，Hexo生成的超链接都是绝对地址。例如，如果您的网站域名为`example.com`,您有一篇文章名为`hello`，那么绝对链接可能像这样：`http://example.com/hello.html`，它是**绝对**于域名的。相对链接像这样：`/hello.html`，也就是说，无论用什么域名访问该站点，都没有关系，这在进行反向代理时可能用到。通常情况下，建议使用绝对地址。

### 分类 & 标签

| 参数                 | 描述   | 默认值             |
| ------------------ | ---- | --------------- |
| `default_category` | 默认分类 | `uncategorized` |
| `category_map`     | 分类别名 |                 |
| `tag_map`          | 标签别名 |                 |

### 日期 / 时间格式

Hexo 使用 [Moment.js](http://momentjs.com/) 来解析和显示时间。

| 参数            | 描述   | 默认值          |
| ------------- | ---- | ------------ |
| `date_format` | 日期格式 | `YYYY-MM-DD` |
| `time_format` | 时间格式 | `H:mm:ss`    |

### 分页

| 参数               | 描述                    | 默认值    |
| ---------------- | --------------------- | ------ |
| `per_page`       | 每页显示的文章量 (0 = 关闭分页功能) | `10`   |
| `pagination_dir` | 分页目录                  | `page` |

### 扩展

| 参数       | 描述                    |
| -------- | --------------------- |
| `theme`  | 当前主题名称。值为`false`时禁用主题 |
| `deploy` | 部署部分的设置               |

## 开始写文章！
文章位于`source/_post`文件夹内，以markdown为格式。要新建一篇文章，在网站根目录中打开CMD或Powershell,输入`hexo new "文章标题"`便可创建文章。文章分为Front-matter和内容。

### Front-matter

Front-matter 是文件最上方以 `---` 分隔的区域，用于指定个别文件的变量，举例来说：

```
title: Hello World
date: 2013/7/13 20:46:25
---
```

以下是预先定义的参数，您可在模板中使用这些参数值并加以利用。

| 参数           | 描述         | 默认值    |
| ------------ | ---------- | ------ |
| `layout`     | 布局         |        |
| `title`      | 标题         |        |
| `date`       | 建立日期       | 文件建立日期 |
| `updated`    | 更新日期       | 文件更新日期 |
| `comments`   | 开启文章的评论功能  | true   |
| `tags`       | 标签（不适用于分页） |        |
| `categories` | 分类（不适用于分页） |        |
| `permalink`  | 覆盖文章网址     |        |

#### 分类和标签

只有文章支持分类和标签，您可以在 Front-matter 中设置。在其他系统中，分类和标签听起来很接近，但是在 Hexo 中两者有着明显的差别：分类具有顺序性和层次性，也就是说 `Foo, Bar` 不等于 `Bar, Foo`；而标签没有顺序和层次。

```yaml
categories:
- Diary
tags:
- PS3
- Games
```

> 分类方法的分歧
>
> 如果您有过使用WordPress的经验，就很容易误解Hexo的分类方式。WordPress支持对一篇文章设置多个分类，而且这些分类可以是同级的，也可以是父子分类。但是Hexo不支持指定多个同级分类。下面的指定方法：
>
> ```yaml
> categories:
> - Diary
> - Life
> ```
>
> 会使分类`Life`成为`Diary`的子分类，而不是并列分类。因此，有必要为您的文章选择尽可能准确的分类。

### 内容
内容以Markdown和标签(tag plugin)来输入。此处附上一份[Markdown说明手册](http://blog.leanote.com/post/freewalk/Markdown-语法手册)和[官方的插件说明](https://hexo.io/zh-cn/docs/tag-plugins.html)给大家*其实是懒得打了（滑稽*。

## 发布

写完了，当然要发布啦！最简单的方法是安装官方的git deploy插件：在网站根目录输入`npm install hexo-deployer-git --save`

然后修改_config.yml

```
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
  message: [message]
```

| 参数        | 描述                                       |
| --------- | ---------------------------------------- |
| `repo`    | 库（Repository）地址,不要输入SSH地址！               |
| `branch`  | 分支名称。如果您使用的是 GitHub 或 GitCafe 的话，程序会尝试自动检测。 |
| `message` | 自定义提交信息 (默认为 `Site updated: \{\{ now('YYYY-MM-DD HH:mm:ss') \}\}`) |

然后在网站根目录输入`hexo deploy`就可以发布啦！

# English

## Introduction

Hexo is an easy(nope) generator for Hexo blog, with help of GitHub Pages, it will be a perfect platform for blogging. However, to newbies, Hexo is still hard to use and configure, so I am here to claim first:

1. Hexo is hard, you need to patience to learn;
2. You have also be willing to learn and solve problems;
3. You don't need to understand HTML, actually.

## Create GitHub Pages

1. Open <github.com>, choose the plus icon at top left corner and choose "new repository";

![](/images/hg/1.png)

2. Type "<yourname>.github.io" in Repository Name. if you name is `dalao`, you should type dalao.github.io, tick "Initialize this repository with a README", and the click "Create Repository";

![](/images/hg/2.png)

3. Then you repository is ready. Choose "Settings", untick the "Wikis", "Issues" and "Projects" under "Feature".

![](/images/hg/3.png)

Now, your GitHub Pages is ready.

## Install Hexo

1. Download [GitHub Client](https://desktop.github.com) and install, open it and log in first;

![](/images/hg/4.png)

2. Go to [NodeJS Website](https://nodejs.org/),Download and install Current or LTS version;

![](/images/hg/5.png)

3. Open a command prompt or Powershell with administration rights, type `npm install -g hexo-cli` and waiting for it to complete;
4. Create a folder for your website base, and copy its address, like *C:\Files\Desktop\website*;
5. Open a command prompt or Powershell with administration rights,type`cd "your copied address"` and type enter, then type `hexo init`and then `npm install`to create the website.

![](/images/hg/6.png)

## Hexo Framework

Once initialised, here’s what your project folder will look like:

```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```

### _config.yml

Site [configuration](https://hexo.io/docs/configuration.html) file. You can configure most settings here.

### package.json

Application data. The [EJS](http://embeddedjs.com/), [Stylus](http://learnboost.github.io/stylus/) and [Markdown](http://daringfireball.net/projects/markdown/) renderers are installed by default. If you want, you can uninstall them later.

```json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "hexo": {
    "version": ""
  },
  "dependencies": {
    "hexo": "^3.0.0",
    "hexo-generator-archive": "^0.1.0",
    "hexo-generator-category": "^0.1.0",
    "hexo-generator-index": "^0.1.0",
    "hexo-generator-tag": "^0.1.0",
    "hexo-renderer-ejs": "^0.1.0",
    "hexo-renderer-stylus": "^0.2.0",
    "hexo-renderer-marked": "^0.2.4",
    "hexo-server": "^0.1.2"
  }
}
```

### scaffolds

[Scaffold](https://hexo.io/docs/writing.html#Scaffolds) folder. When you create a new post, Hexo bases the new file on the scaffold.

### source

Source folder. This is where you put your site’s content. Hexo ignores hidden files and files or folders whose names are prefixed with `_` (underscore) - except the `_posts` folder. Renderable files (e.g. Markdown, HTML) will be processed and put into the `public` folder, while other files will simply be copied.

### themes

[Theme](https://hexo.io/docs/themes.html) folder. Hexo generates a static website by combining the site contents with the theme.

## Configure your Websites



You can modify site settings in `_config.yml` or in an [alternate config file](https://hexo.io/docs/configuration.html#Using-an-Alternate-Config).

### Site

| Setting       | Description                              |
| ------------- | ---------------------------------------- |
| `title`       | The title of your website                |
| `subtitle`    | The subtitle of your website             |
| `description` | The description of your website          |
| `author`      | Your name                                |
| `language`    | The language of your website. Use a [2-lettter ISO-639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes). Default is `en`. |
| `timezone`    | The timezone of your website. Hexo uses the setting on your computer by default. You can find the list of available timezones [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). Some examples are `America/New_York`, `Japan`, and `UTC`. |

### URL

| Setting              | Description                              | Default                     |
| -------------------- | ---------------------------------------- | --------------------------- |
| `url`                | The URL of your website                  |                             |
| `root`               | The root directory of your website       |                             |
| `permalink`          | The [permalink](https://hexo.io/docs/permalinks.html) format of articles | `:year/:month/:day/:title/` |
| `permalink_defaults` | Default values of each segment in permalink |                             |

> Website in subdirectory
>
> If your website is in a subdirectory (such as `http://example.org/blog`) set `url` to `http://example.org/blog` and set `root` to `/blog/`.

### Directory

| Setting        | Description                              | Default          |
| -------------- | ---------------------------------------- | ---------------- |
| `source_dir`   | Source folder. Where your content is stored | `source`         |
| `public_dir`   | Public folder. Where the static site will be generated | `public`         |
| `tag_dir`      | Tag directory                            | `tags`           |
| `archive_dir`  | Archive directory                        | `archives`       |
| `category_dir` | Category directory                       | `categories`     |
| `code_dir`     | Include code directory                   | `downloads/code` |
| `i18n_dir`     | i18n directory                           | `:lang`          |
| `skip_render`  | Paths not to be rendered. You can use [glob expressions](https://github.com/isaacs/minimatch) for path matching |                  |

### Writing

| Setting             | Description                              | Default     |
| ------------------- | ---------------------------------------- | ----------- |
| `new_post_name`     | The filename format for new posts        | `:title.md` |
| `default_layout`    | Default layout                           | `post`      |
| `titlecase`         | Transform titles into title case?        | `false`     |
| `external_link`     | Open external links in new tab?          | `true`      |
| `filename_case`     | Transform filenames to `1` lower case; `2` upper case | `0`         |
| `render_drafts`     | Display drafts?                          | `false`     |
| `post_asset_folder` | Enable the [Asset Folder](https://hexo.io/docs/asset-folders.html)? | `false`     |
| `relative_link`     | Make links relative to the root folder?  | `false`     |
| `future`            | Display future posts?                    | `true`      |
| `highlight`         | Code block settings                      |             |

### Category & Tag

| Setting            | Description      | Default         |
| ------------------ | ---------------- | --------------- |
| `default_category` | Default category | `uncategorized` |
| `category_map`     | Category slugs   |                 |
| `tag_map`          | Tag slugs        |                 |

### Date / Time format

Hexo uses [Moment.js](http://momentjs.com/) to process dates.

| Setting       | Description | Default      |
| ------------- | ----------- | ------------ |
| `date_format` | Date format | `YYYY-MM-DD` |
| `time_format` | Time format | `HH:mm:ss`   |

### Pagination

| Setting          | Description                              | Default |
| ---------------- | ---------------------------------------- | ------- |
| `per_page`       | The amount of the posts displayed on a single page. `0` disables pagination | `10`    |
| `pagination_dir` | Pagination directory                     | `page`  |

### Extensions

| Setting  | Description                          |
| -------- | ------------------------------------ |
| `theme`  | Theme name. `false` disables theming |
| `deploy` | Deployment setting                   |

### Include/Exclude Files or Folders

In the config file, set the include/exlude key to make hexo explicitly process or ignore certain files/folders.

| Setting   | Description                              |
| --------- | ---------------------------------------- |
| `include` | Hexo defaultly ignore hidden files and folders, but set this field will make Hexo process them |
| `exclude` | Hexo process will ignore files list under this field |

Sample:

```
# Include/Exclude Files/Folders
include:
  - .nojekyll
exclude:
  - .DS_Store
```

### Using an Alternate Config

A custom config file path can be specified by adding the `--config` flag to your `hexo` commands with a path to an alternate YAML or JSON config file, or a comma-separated list (no spaces) of multiple YAML or JSON files.

```
# use 'custom.yml' in place of '_config.yml'
$ hexo server --config custom.yml

# use 'custom.yml' & 'custom2.json', prioritizing 'custom2.json'
$ hexo server --config custom.yml,custom2.json
```

Using multiple files combines all the config files and saves the merged settings to `_multiconfig.yml`. The later values take precedence. It works with any number of JSON and YAML files with arbitrarily deep objects. Note that **no spaces are allowed in the list**.

For instance, in the above example if `foo: bar` is in `custom.yml`, but `"foo": "dinosaur"` is in `custom2.json`, `_multiconfig.yml` will contain `foo: dinosaur`.

## Start Writing!
posts are located in `source/_post`as a markdown file. To create a new article, type `hexo new "your title"` to create one. the file can be devided into Front-matter and content.

### Front-matter

Front-matter is a block of YAML or JSON at the beginning of the file that is used to configure settings for your writings. Front-matter is terminated by three dashes when written in YAML or three semicolons when written in JSON.

**YAML**

```
title: Hello World
date: 2013/7/13 20:46:25
---
```

**JSON**

```
"title": "Hello World",
"date": "2013/7/13 20:46:25"
```
#### Settings & Their Default Values

| Setting      | Description                              | Default           |
| ------------ | ---------------------------------------- | ----------------- |
| `layout`     | Layout                                   |                   |
| `title`      | Title                                    |                   |
| `date`       | Published date                           | File created date |
| `updated`    | Updated date                             | File updated date |
| `comments`   | Enables comment feature for the post     | true              |
| `tags`       | Tags (Not available for pages)           |                   |
| `categories` | Categories (Not available for pages)     |                   |
| `permalink`  | Overrides the default permalink of the post |                   |

#### Categories & Tags

Only posts support the use of categories and tags. Categories apply to posts in order, resulting in a hierarchy of classifications and sub-classifications. Tags are all defined on the same hierarchical level so the order in which they appear is not important.

**Example**

```
categories:
- Sports
- Baseball
tags:
- Injury
- Fight
- Shocking
```

### Content
content can be enriched by Markdown and tag plugin.You can learn tag plugin [here](https://hexo.io/docs/tag-plugins.html) and Markdown [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

## Deploy

The easiest way to deploy is to use the offical plugin: `npm install hexo-deployer-git --save`

Edit `_config.yml`

```
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
  message: [message]
```

| Option    | Description                              |
| --------- | ---------------------------------------- |
| `repo`    | GitHub/Bitbucket/Coding/GitLab repository URL |
| `branch`  | Branch name. The deployer will detect the branch automatically if you are using GitHub or GitCafe. |
| `message` | Customize commit message (Default to `Site updated: \{\{ now('YYYY-MM-DD HH:mm:ss') \}\}`) |

and then type `hexo deploy` to deploy the website.