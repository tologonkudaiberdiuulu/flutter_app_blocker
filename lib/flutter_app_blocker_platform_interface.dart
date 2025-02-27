import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_app_blocker_method_channel.dart';

abstract class FlutterAppBlockerPlatform extends PlatformInterface {
  /// Constructs a FlutterAppBlockerPlatform.
  FlutterAppBlockerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAppBlockerPlatform _instance = MethodChannelFlutterAppBlocker();

  /// The default instance of [FlutterAppBlockerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppBlocker].
  static FlutterAppBlockerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppBlockerPlatform] when
  /// they register themselves.
  static set instance(FlutterAppBlockerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
