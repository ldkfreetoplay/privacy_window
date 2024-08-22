import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'privacy_window_platform_interface.dart';

/// An implementation of [PrivacyWindowPlatform] that uses method channels.
class MethodChannelPrivacyWindow extends PrivacyWindowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('f_privacy_window');

  @override
  setPrivacyWindow() async {
    await methodChannel.invokeMethod<String>('setPrivacyWindow');
  }

  @override
  unSetPrivacyWindow() async {
    await methodChannel.invokeMethod<String>('unSetPrivacyWindow');
  }

}
