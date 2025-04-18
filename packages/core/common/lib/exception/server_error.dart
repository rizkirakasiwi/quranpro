import 'package:common/exception/app_exception.dart';

class ServerError implements AppException {
  final String? exception;

  ServerError(this.exception);

  @override
  String? getMessage() {
    return exception;
  }
}