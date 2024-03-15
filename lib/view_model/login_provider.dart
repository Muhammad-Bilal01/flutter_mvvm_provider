import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/repository/app_repository.dart';
import 'package:flutter_mvvm_provider/utils/common_toast.dart';

import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  final AppRepository _appRepository = AppRepository();

  // Future<void> userLogin(dynamic data) async {
  //   await _appRepository.userLogin(data).then((value) {
  //     debugPrint(value);
  //   }).onError((error, stackTrace) {
  //     commonToast("Something Went Wrong!");
  //     debugPrint("ERROR: $error");
  //   });
  // }

  Future<dynamic> userLogin(Map data) async {
    debugPrint(data.toString());
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": "eve.holt@reqres.in",
          "password": "cityslicka"
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        debugPrint("response $json");
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<http.Response> createAlbum(String title) async {
    var res = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    print(res.statusCode);

    return res;
  }
}
