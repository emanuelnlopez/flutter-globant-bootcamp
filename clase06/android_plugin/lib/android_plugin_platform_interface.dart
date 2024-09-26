import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_plugin_method_channel.dart';

abstract class AndroidPluginPlatform extends PlatformInterface {
  /// Constructs a AndroidPluginPlatform.
  AndroidPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidPluginPlatform _instance = MethodChannelAndroidPlugin();

  /// The default instance of [AndroidPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidPlugin].
  static AndroidPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidPluginPlatform] when
  /// they register themselves.
  static set instance(AndroidPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceName() {
    throw UnimplementedError('getDeviceName() has not been implemented.');
  }

  Future<void> setScreenshotEnabled(bool enabled) async {
    throw UnimplementedError(
      'setScreenshotEnabled() has not been implemented.',
    );
  }
}
