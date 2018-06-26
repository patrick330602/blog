---
title: meta and link tags in HTML
comments: false
shares: false
---
## TL;DR

Here is some good `<meta>` and `<link>` tag that can be used in `<head>` tag in HTML to enhance the websites.

## Icons

### Chrome & Opera

```html
<!-- icon in the highest resolution we need it for -->
<link rel="icon" sizes="192x192" href="icon.png">
```

> Allowed size: 48px, 96px, 144px and 192px or multiples of 48px.

### Safari

```html
<link rel="apple-touch-icon" href="touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76" href="touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad-retina.png">
```

### Internet Explorer & Windows Phone

```html
<meta name="msapplication-square70x70logo" content="icon_smalltile.png">
<meta name="msapplication-square150x150logo" content="icon_mediumtile.png">
<meta name="msapplication-wide310x150logo" content="icon_widetile.png">
```

### Tiles in IE
A xml file needed to be created and referred like following:

```html
<meta name="msapplication-config" content="ieconfig.xml" />
```

`ieconfig.xml` will contain definitions of the tiles.

More detialed information can be retrived [here][1].

#### Static Tiles

```xml
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
  <msapplication>
    <tile>
      <square70x70logo src="images/smalltile.png"/>
      <square150x150logo src="images/mediumtile.png"/>
      <wide310x150logo src="images/widetile.png"/>
      <square310x310logo src="images/largetile.png"/>
      <TileColor>#009900</TileColor>
    </tile>
  </msapplication>
</browserconfig>
```

#### Live Tiles

```xml
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
  <msapplication>
    <tile>
      <square70x70logo src="images/smalltile.png"/>
      <square150x150logo src="images/mediumtile.png"/>
      <wide310x150logo src="images/widetile.png"/>
      <square310x310logo src="images/largetile.png"/>
      <TileColor>#009900</TileColor>
    </tile>
    <notification>
      <polling-uri  src="notifications/contoso1.xml"/>
      <polling-uri2 src="notifications/contoso2.xml"/>
      <polling-uri3 src="notifications/contoso3.xml"/>
      <frequency>30</frequency>
      <cycle>1</cycle>
    </notification>
  </msapplication>
</browserconfig>
```

## Color

```html
<!-- Chrome, Firefox OS and Opera -->
<meta name="theme-color" content="#4285f4">
```

## Miscellaneous

### Safari Startup Image

```html
<link rel="apple-touch-startup-image" href="icon.png">
```

> Please follow the [guidelines](https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html) here.

### Safari Status Bar Appearance

```html
<meta name="apple-mobile-web-app-status-bar-style" content="black">
```

> `content` can be `black` or `black-translucent`.

### Android Manifest

```html
<link rel="manifest" href="/manifest.json">
```

sample manifest:
```json
{
  "short_name": "AirHorner",
  "name": "Kinlan's AirHorner of Infamy",
  "icons": [
    {
      "src": "launcher-icon-1x.png",
      "type": "image/png",
      "sizes": "48x48"
    },
    {
      "src": "launcher-icon-2x.png",
      "type": "image/png",
      "sizes": "96x96"
    },
    {
      "src": "launcher-icon-4x.png",
      "type": "image/png",
      "sizes": "192x192"
    }
  ],
  "start_url": "index.html?launcher=true",
  "background_color": "#2196F3",
  "display": "standalone",//browser/lanscape
  "theme_color": "#2196F3"


}

```

[1]: https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/samples/dn455115(v=vs.85)