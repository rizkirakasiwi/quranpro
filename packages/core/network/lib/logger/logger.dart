abstract class Logger {
  void logRequest(String method, String url, Map<String, String>? headers, [dynamic body]);
  void logResponse(int statusCode, String url, String body);
}
