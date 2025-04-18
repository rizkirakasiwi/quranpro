class NetworkResponse<T> {
  final num? code;
  final String? status;
  final T? data;

  NetworkResponse({this.code, this.status, this.data});

  factory NetworkResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    final rawData = json['data'];
    final T parsedData;

    if (rawData is List) {
      parsedData = fromJsonT(rawData);
    } else if (rawData is Map) {
      parsedData = fromJsonT(rawData);
    } else {
      parsedData = rawData;
    }

    return NetworkResponse<T>(
      code: json['code'],
      status: json['status'],
      data: parsedData,
    );
  }
}
