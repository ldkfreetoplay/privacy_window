import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'privacy_window_method_channel.dart';

abstract class PrivacyWindowPlatform extends PlatformInterface {
  /// Constructs a PrivacyWindowPlatform.
  PrivacyWindowPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrivacyWindowPlatform _instance = MethodChannelPrivacyWindow();

  /// The default instance of [PrivacyWindowPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrivacyWindow].
  static PrivacyWindowPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrivacyWindowPlatform] when
  /// they register themselves.
  static set instance(PrivacyWindowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  setPrivacyWindow() async {
    throw UnimplementedError('setPrivacyWindow() has not been implemented.');
  }

  unSetPrivacyWindow() async {
    throw UnimplementedError('unSetPrivacyWindow() has not been implemented.');
  }

}
