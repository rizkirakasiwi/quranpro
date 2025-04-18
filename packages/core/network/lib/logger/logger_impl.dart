// Debug implementation that only logs in debug mode
import 'package:flutter/foundation.dart';
import 'package:network/logger/logger.dart';

class LoggerImpl implements Logger {
  @override
  void logRequest(
    String method,
    String url,
    Map<String, String>? headers, [
    dynamic body,
  ]) {
    if (kDebugMode) {
      print('➡️ $method $url');
      print('Headers: ${headers ?? {}}');
      if (body != null) print('Body: $body');
    }
  }

  @override
  void logResponse(int statusCode, String url, String body) {
    if (kDebugMode) {
      print('⬅️ $statusCode $url');
      print('Response: $body');
    }
  }
}
