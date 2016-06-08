---
layout: post
title: How to create a new window in UWP
---

Some friends of mine asked me how to create a window like this:

![new window in UWP]({{ site.baseurl }}/images/new-window.png)

I cannot say this is difficult or simple. In order to open a new window, You need to use CoreApplication.CreateNewView() to generate the Window, or view:

```C#
var currentAV = ApplicationView.GetForCurrentView();

await newAV.Dispatcher.RunAsync(
 CoreDispatcherPriority.Normal,
 async () =>
 {
 var newWindow = Window.Current;
 var newAppView = ApplicationView.GetForCurrentView();newAppView.Title = title;  //The title of new windowvar frame = new Frame();
 frame.Navigate(typeof(Page), Datatosend); //Navigation is here
 newWindow.Content = frame;
 newWindow.Activate();await ApplicationViewSwitcher.TryShowAsStandaloneAsync(
newAppView.Id,
 ViewSizePreference.UseMinimum,
currentAV.Id,
 ViewSizePreference.UseMinimum);
 });
 ```