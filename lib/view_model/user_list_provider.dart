import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/repository/app_repository.dart';
import 'package:flutter_mvvm_provider/models/services/api_response.dart';
import 'package:flutter_mvvm_provider/models/user_list.dart';
import 'package:flutter_mvvm_provider/utils/common_toast.dart';

class UserListProvider with ChangeNotifier {
  final _appRepository = AppRepository();

  // fetch user

  ApiResponse<UserList> userList = ApiResponse.loading();
  setUserList(ApiResponse<UserList> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserList() async {
    print("object...");
    setUserList(ApiResponse.loading());
    _appRepository.fetchUser().then((value) {
      debugPrint("value : " + value.toString());
      setUserList(ApiResponse.complete(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
      commonToast("Something Went Wrong!");
      debugPrint("ERROR: $error");
    });
  }
}
