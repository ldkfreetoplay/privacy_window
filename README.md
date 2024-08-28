# privacy_window
 A flutter plugin for OHOS platform, used to set up a privacy window

 一个flutter插件，用于实现鸿蒙next平台下，口令页面要求防止截屏的功能。
# install

``` YAML
  privacy_window:
    git:
     url: https://github.com/ldkfreetoplay/privacy_window
```

# example

首先需要添加权限，在ohos项目的module 文件里面的requestPermissions添加上ohos.permission.PRIVACY_WINDOW

``` json
     "requestPermissions": [
      {
        "name": "ohos.permission.PRIVACY_WINDOW"
      }
    ]
```


``` dart
import 'package:privacy_window/privacy_window.dart';

  setPrivateWindow() {
    PrivacyWindow().setPrivacyWindow();
  }

  unSetPrivateWindow() {
    PrivacyWindow().unSetPrivacyWindow();
  }

```
