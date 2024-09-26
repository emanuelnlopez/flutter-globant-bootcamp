import 'package:flutter/services.dart';

class AndroidPlugin {
  final methodChannel = const MethodChannel('android_plugin');

  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
