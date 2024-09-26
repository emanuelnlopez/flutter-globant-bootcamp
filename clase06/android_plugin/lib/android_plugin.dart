import 'package:flutter/services.dart';

class AndroidPlugin {
  final methodChannel = const MethodChannel('android_plugin');
  final networkChannel = const EventChannel('network_status');

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

  Stream<bool> get networkStatusStream {
    return networkChannel
        .receiveBroadcastStream()
        .map<bool>((dynamic event) => event as bool);
  }
}
