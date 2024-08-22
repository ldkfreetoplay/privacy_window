import 'package:flutter_test/flutter_test.dart';
import 'package:privacy_window/privacy_window.dart';
import 'package:privacy_window/privacy_window_platform_interface.dart';
import 'package:privacy_window/privacy_window_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPrivacyWindowPlatform
    with MockPlatformInterfaceMixin
    implements PrivacyWindowPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PrivacyWindowPlatform initialPlatform = PrivacyWindowPlatform.instance;

  test('$MethodChannelPrivacyWindow is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrivacyWindow>());
  });

  test('getPlatformVersion', () async {
    PrivacyWindow privacyWindowPlugin = PrivacyWindow();
    MockPrivacyWindowPlatform fakePlatform = MockPrivacyWindowPlatform();
    PrivacyWindowPlatform.instance = fakePlatform;

    expect(await privacyWindowPlugin.getPlatformVersion(), '42');
  });
}
