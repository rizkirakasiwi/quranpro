import 'dart:convert';

import 'package:config/flavor_env.dart';
import 'package:network/core/network_client.dart';
import 'package:http/http.dart' as http;
import 'package:network/logger/logger.dart';
import 'package:network/logger/logger_impl.dart';
import 'package:network/response/network_response.dart';

class HttpNetworkClient implements NetworkClient {
  static String baseUrl = FlavorEnv.baseUrl;
  final http.Client _http = http.Client();

  final Logger _logger;

  HttpNetworkClient({Logger? logger}) : _logger = logger ?? LoggerImpl();

  @override
  Future<NetworkResponse<T>> get<T>(
    String path, {
    Map<String, String>? headers,
    required T Function(dynamic json) fromJsonT,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final builtHeaders = _buildHeaders(headers);

    _logger.logRequest('GET', uri.toString(), builtHeaders);

    final response = await _http.get(uri, headers: builtHeaders);

    _logger.logResponse(response.statusCode, uri.toString(), response.body);

    final jsonMap = json.decode(response.body);
    return NetworkResponse<T>.fromJson(jsonMap, fromJsonT);
  }

  @override
  Future<NetworkResponse<T>> post<T>(
    String path, {
    Map<String, String>? headers,
    dynamic body,
    required T Function(dynamic json) fromJsonT,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final builtHeaders = _buildHeaders(headers);
    final encodedBody = json.encode(body);

    _logger.logRequest('POST', uri.toString(), builtHeaders, encodedBody);

    final response = await _http.post(
      uri,
      headers: builtHeaders,
      body: encodedBody,
    );

    _logger.logResponse(response.statusCode, uri.toString(), response.body);

    final jsonMap = json.decode(response.body);
    return NetworkResponse<T>.fromJson(jsonMap, fromJsonT);
  }

  Map<String, String> _buildHeaders(Map<String, String>? headers) => {
    'Content-Type': 'application/json',
    ...?headers,
  };
}
