import 'package:flutter_mvvm_provider/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

commonToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: blackColor,
    textColor: whiteColor,
    fontSize: 16.0,
  );
}
