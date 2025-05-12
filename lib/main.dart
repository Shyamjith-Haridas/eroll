import 'package:eroll/core/routes/app_route_config.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteNames.splashScreen,
      onGenerateRoute: AppRouteConfig.onGenerateRoute,
    );
  }
}
