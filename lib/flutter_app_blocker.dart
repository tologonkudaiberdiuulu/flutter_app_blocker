import 'package:flutter/services.dart';

class AppBlocker {
  static const MethodChannel _channel = MethodChannel('app_blocker');

  /// Starts the accessibility service for app blocking
  static Future<void> startService() async {
    await _channel.invokeMethod('startService');
  }

  /// Stops the accessibility service
  static Future<void> stopService() async {
    await _channel.invokeMethod('stopService');
  }

  /// Updates the list of blocked apps
  static Future<void> updateBlockedApps(List<String> packageNames) async {
    await _channel.invokeMethod('updateBlockedApps', {'apps': packageNames});
  }
}
