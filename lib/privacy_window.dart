
import 'dart:io';

import 'privacy_window_platform_interface.dart';


class PrivacyWindow {

  setPrivacyWindow() {
    if (Platform.operatingSystem == 'ohos') {
      PrivacyWindowPlatform.instance.setPrivacyWindow();
    } 
  }

  unSetPrivacyWindow() {
    if (Platform.operatingSystem == 'ohos') {
      PrivacyWindowPlatform.instance.unSetPrivacyWindow();
    } 
  }
}
