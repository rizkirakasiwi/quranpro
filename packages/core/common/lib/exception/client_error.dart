import 'package:common/exception/app_exception.dart';

class ClientError implements AppException {

  final String? message;

  ClientError(this.message);

  @override
  String? getMessage() {
    return message;
  }
}
