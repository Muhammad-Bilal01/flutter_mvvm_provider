import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_provider/constant/colors.dart';
import 'package:flutter_mvvm_provider/routes/name_routes.dart';
import 'package:flutter_mvvm_provider/utils/common_toast.dart';
import 'package:flutter_mvvm_provider/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Map args;
  const LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";

  @override
  void initState() {
    if (widget.args.containsKey('title')) {
      name = widget.args['title'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                  //     context, RoutesName.homeScreen);

                  Map data = {
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka"
                  };
                  loginProvider.userLogin(data);
                  // loginProvider.createAlbum("title");
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: whiteColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
