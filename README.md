#Native Logger ANE (Android)
[![Build Status](https://travis-ci.org/alexandrratush/Native-Logger-ANE.svg?branch=master)](https://travis-ci.org/alexandrratush/Native-Logge
r-ANativeLoggerExtension.getInstance().debug("tag", "message");lexandrratush/Native-Logger-ANE.svg?branch=master)](https://travis-ci.org/alexandrratush/Native-Logger-ANE)
[![GitHub version](https://badge.fury.io/gh/alexandrratush%2FNative-Logger-ANE.svg)](https://badge.fury.io/gh/alexandrratush%2FNative-Logger-ANE)
![](https://reposs.herokuapp.com/?path=alexandrratush/Native-Logger-ANE&style=flat)
######Native Extension for Adobe AIR
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

###API

* `NativeLoggerExtension.getInstance().verbose("tag", "message");` - Send a VERBOSE log message.
* `NativeLoggerExtension.getInstance().debug("tag", "message");` - Send a DEBUG log message.
* `NativeLoggerExtension.getInstance().info("tag", "message");` - Send an INFO log message.
* `NativeLoggerExtension.getInstance().warn("tag", "message");` - Send a WARN log message.
* `NativeLoggerExtension.getInstance().error("tag", "message");` - Send an ERROR log message.
* `NativeLoggerExtension.getInstance().dispose();` - Dispose native extension.