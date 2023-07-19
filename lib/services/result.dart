import 'message.dart';

class Result<T> {
  bool success;
  T? data;
  Object? error;
  String? errorMessage;
  StackTrace? stackTrace;
  int? statusCode;

  Result({this.success = false, this.data, this.errorMessage, this.statusCode});

  Result.success(this.statusCode, this.data) : success = true;

  Result.failure(this.error, this.stackTrace) : success = false;

  Result.failMsg(this.errorMessage) : success = false;

  factory Result.msg(Message msg,
      {String? errorMessage, bool success = false}) {
    return Result(success: success, data: null, errorMessage: errorMessage);
  }

  @override
  String toString() {
    return 'Result{success: $success, data: $data, error: $error, errorMessage: $errorMessage}';
  }

}

