import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/routes/name_routes.dart';
import 'package:flutter_mvvm_provider/view_model/login_provider.dart';
import 'package:flutter_mvvm_provider/views/home_screen.dart';
import 'package:flutter_mvvm_provider/views/login_screen.dart';
import 'package:flutter_mvvm_provider/views/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // Pass argument with name routes
      case RoutesName.loginScreen:
        final Map args = setting.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: LoginScreen(
              args: args,
            ),
          ),
        );

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // If no routes found
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("404 | Something Went Wrong!"),
            ),
          ),
        );
    }
  }
}
