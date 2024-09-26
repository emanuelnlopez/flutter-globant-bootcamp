import 'package:flutter_test/flutter_test.dart';
import 'package:android_plugin/android_plugin.dart';
import 'package:android_plugin/android_plugin_platform_interface.dart';
import 'package:android_plugin/android_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidPluginPlatform
    with MockPlatformInterfaceMixin
    implements AndroidPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidPluginPlatform initialPlatform = AndroidPluginPlatform.instance;

  test('$MethodChannelAndroidPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidPlugin>());
  });

  test('getPlatformVersion', () async {
    AndroidPlugin androidPlugin = AndroidPlugin();
    MockAndroidPluginPlatform fakePlatform = MockAndroidPluginPlatform();
    AndroidPluginPlatform.instance = fakePlatform;

    expect(await androidPlugin.getPlatformVersion(), '42');
  });
}
