import 'package:eroll/core/routes/app_route_config.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/core/themes/app_themes.dart';
import 'package:eroll/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
