class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);


  @override
  String toString() {

    return '$_message$_prefix';
  }
}

class NoInternetException extends AppExceptions {

  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}

class FetchDataException extends AppExceptions {

  FetchDataException([String? message]) : super(message, "Error fetching data, please try later.");
}

class UnAuthorizedException extends AppExceptions {

  UnAuthorizedException([String? message]) : super(message, "You don't have access to this");
}

class RequestTimeOutException extends AppExceptions {

  RequestTimeOutException([String? message]) : super(message, 'Request Time Out');
}

class ApiResponseException implements Exception {
  final int statusCode;
  final String message;
  ApiResponseException(this.statusCode, this.message);
}