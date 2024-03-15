import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_provider/models/services/network_services.dart';

class AppRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  final String baseURL = "https://reqres.in/";

  Future<dynamic> userLogin(dynamic data) async {
    try {
      final response =
          await _apiServices.postAPi("$baseURL${"api/login"}", data);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
