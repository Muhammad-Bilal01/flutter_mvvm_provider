class AppException implements Exception {
  final String prefix;
  final String message;

  AppException({this.prefix = "", required this.message});

  @override
  String toString() {
    return "$prefix : $message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(message: "Error During Communication");
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message}) : super(message: "UnAuthorized");
}
