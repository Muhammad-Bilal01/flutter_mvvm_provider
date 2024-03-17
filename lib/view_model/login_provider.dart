import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/repository/app_repository.dart';
import 'package:flutter_mvvm_provider/utils/common_toast.dart';

import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  final _appRepository = AppRepository();

  // user Login
  Future<void> userLogin(dynamic data) async {
    print(data);
    print(data.runtimeType);
    await _appRepository.userLogin(data).then((value) {
      debugPrint(value);
    }).onError((error, stackTrace) {
      commonToast("Something Went Wrong!");
      debugPrint("ERROR: $error");
    });
  }

/*
  Future<dynamic> userLogin(dynamic data) async {
    debugPrint(data.toString());
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      http.Response response = await http.post(
        url,
        body: data,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        commonToast("Login");
        var json = jsonDecode(response.body);
        debugPrint("response $json");
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
*/
}
