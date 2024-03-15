import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/routes/name_routes.dart';
import 'package:flutter_mvvm_provider/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesName.loginScreen,
          arguments: {"title": "Login"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Image.asset(
            "assets/images/splash_image.png",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
