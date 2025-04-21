import 'package:network/response/network_response.dart';

// Abstract HTTP client interface for dependency inversion
abstract class NetworkClient {
  Future<NetworkResponse<T>> get<T>(
    String path, {
    Map<String, String>? headers,
    required T Function(dynamic json) fromJsonT,
  });

  Future<NetworkResponse<T>> post<T>(
    String path, {
    Map<String, String>? headers,
    dynamic body,
    required T Function(dynamic json) fromJsonT,
  });

  Future<T> getAlt<T>(
      String path, {
        Map<String, String>? headers,
        required String baseUrl,
        required T Function(dynamic json) fromJsonT,
      });

  Future<T> postAlt<T>(
      String path, {
        Map<String, String>? headers,
        required String baseUrl,
        dynamic body,
        required T Function(dynamic json) fromJsonT,
      });
}
