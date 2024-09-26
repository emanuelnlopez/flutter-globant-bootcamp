import 'package:flutter/services.dart';

class AndroidPlugin {
  final methodChannel = const MethodChannel('android_plugin');

  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  Future<String?> getDeviceName() async {
    final deviceName = await methodChannel.invokeMethod<String>(
      'getDeviceName',
    );
    return deviceName;
  }

  Future<void> setScreenshotEnabled(bool enabled) async {
    await methodChannel.invokeMethod(
      'setScreenshotEnabled',
      {'enabled': enabled},
    );
  }
}
