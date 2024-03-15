import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_provider/models/services/app_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  // post method
  Future<dynamic> postAPi(String url, dynamic data);

  // get Api
  Future<dynamic> getAPi(String url);

  // delete APi
  Future<dynamic> deleteAPi(String url, int id);

  // update Api
  Future<dynamic> putAPi(String url, int id, dynamic data);
}

class NetworkApiServices extends BaseApiServices {
// to handle api response
  dynamic returnApiResponse(http.Response response) {
    // to manage status code
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 401:
        throw UnAuthorizedException(message: response.body.toString());

      default:
        throw FetchDataException(message: "Error During Communication");
    }
  }

  @override
  Future getAPi(String url) async {
    dynamic responseJson;

    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnApiResponse(response);
    } catch (e) {
      debugPrint(e.toString());
    }

    return responseJson;
  }

  @override
  Future postAPi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: data).timeout(
                const Duration(seconds: 20),
              );
      responseJson = returnApiResponse(response);
    } catch (e) {
      debugPrint(e.toString());
    }

    return responseJson;
  }

  @override
  Future putAPi(String url, int id, data) {
    // TODO: implement putAPi
    throw UnimplementedError();
  }

  @override
  Future deleteAPi(String url, int id) {
    // TODO: implement deleteAPi
    throw UnimplementedError();
  }
}
