import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_plugin_platform_interface.dart';

/// An implementation of [AndroidPluginPlatform] that uses method channels.
class MethodChannelAndroidPlugin extends AndroidPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<String?> getDeviceName() async {
    final deviceName =
        await methodChannel.invokeMethod<String>('getDeviceName');
    return deviceName;
  }

  @override
  Future<void> setScreenshotEnabled(bool enabled) async {
    await methodChannel.invokeMethod(
      'setScreenshotEnabled',
      {'enabled': enabled},
    );
  }
}
