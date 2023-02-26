import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String configVar;

  AppConfig._(this.configVar);

  static AppConfig fromJson(String jsonString) {
    final js = json.decode(jsonString);
    final configVar = js['configVar'];

    return AppConfig._(configVar);
  }

  static Future<AppConfig> load({ TargetPlatform platform = TargetPlatform.android, String env = "local" }) async {
    final platformString = getPlatformString(platform);

    final contents = await rootBundle.loadString(
      'config/$env/$platformString.json',
    );

    return fromJson(contents);
  }

  static getPlatformString(TargetPlatform platform) {
    switch(platform) {
      case TargetPlatform.android:
        return "android";
      case TargetPlatform.iOS:
        return "ios";
      default:
        return "android";
    }
  }
}
