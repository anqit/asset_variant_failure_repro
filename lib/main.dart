import 'package:asset_variant_failure_repro/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('FLUTTER_ENVIRONMENT', defaultValue: 'local');
  final AppConfig config = await AppConfig.load(platform: defaultTargetPlatform, env: env);

  runApp(MyApp(showMe: config.configVar));
}

class MyApp extends StatelessWidget {
  final String showMe;
  const MyApp({super.key, required this.showMe});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(child: Text(showMe)),
    );
  }
}
