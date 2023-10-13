import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_test_platform_interface.dart';

/// An implementation of [PluginTestPlatform] that uses method channels.
class MethodChannelPluginTest extends PluginTestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_test');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
