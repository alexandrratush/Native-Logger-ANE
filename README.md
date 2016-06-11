Native Logger ANE (Android)
=============================
######Native Extension for Adobe AIR [![Build Status](https://travis-ci.org/alexandrratush/Native-Logger-ANE.svg?branch=master)](https://travis-ci.org/alexandrratush/Native-Logger-ANE)
This ane is using the [**android.util.Log**](http://developer.android.com/intl/ru/reference/android/util/Log.html) class. This allows you print out messages to the [**LogCat**](http://developer.android.com/intl/ru/tools/help/logcat.html).

####Using the ANE:

* Add **[NativeLogger.ane](https://github.com/alexandrratush/Native-Logger-ANE/tree/master/ane/bin)** file to your air project.

* Add **com.aratush.ane.NativeLogger** extension id to your application descriptor file. For example:
```xml
<!-- Identifies the ActionScript extensions used by an application. -->
<extensions>
	<extensionID>com.aratush.ane.NativeLogger</extensionID>
</extensions>
```