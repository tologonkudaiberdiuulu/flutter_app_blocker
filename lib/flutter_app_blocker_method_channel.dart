import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_app_blocker_platform_interface.dart';

/// An implementation of [FlutterAppBlockerPlatform] that uses method channels.
class MethodChannelFlutterAppBlocker extends FlutterAppBlockerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_app_blocker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
