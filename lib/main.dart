import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/constant/colors.dart';
import 'package:flutter_mvvm_provider/routes/app_routes.dart';
import 'package:flutter_mvvm_provider/routes/name_routes.dart';
import 'package:flutter_mvvm_provider/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      // home: SplashScreen(), // the old method
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
