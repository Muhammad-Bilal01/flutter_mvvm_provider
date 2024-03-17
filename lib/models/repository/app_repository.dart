import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_provider/models/services/network_services.dart';
import 'package:flutter_mvvm_provider/models/user_list.dart';

class AppRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  String baseURL = "https://reqres.in";

  Future<dynamic> userLogin(dynamic data) async {
    var response = await _apiServices.postAPi("$baseURL${"/api/login"}", data);

    try {
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<UserList?> fetchUser() async {
    var response = await _apiServices.getAPi("$baseURL${"/api/users?page=2"}");
    try {
      print("response ---> " + response);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
