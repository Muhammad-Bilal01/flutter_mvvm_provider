import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/routes/name_routes.dart';
import 'package:flutter_mvvm_provider/views/login_screen.dart';
import 'package:flutter_mvvm_provider/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.loginScreen:
        final Map args = setting.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => LoginScreen(
                  args: args,
                ));

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
