import 'package:common/common.dart';
import 'package:common/exception/app_exception.dart';
import 'package:common/exception/client_error.dart';
import 'package:common/exception/server_error.dart';
import 'package:network/response/network_response.dart';

Future<Either<AppException, List<M>>> fetchWithLocalFallback<T, M>({
    required Future<List<T>> Function() localFetch,
    required Future<NetworkResponse<List<T>>> Function() remoteFetch,
    required M Function(T) mapper,
    Future<void> Function(List<T>)? saveToLocal,
  }) async {
    try {
      final localResult = await localFetch();
      if (localResult.isNotEmpty) {
        return Right(localResult.map(mapper).toList());
      }

      final remoteResult = await remoteFetch();
      final statusCode = remoteResult.code ?? 500;

      if (statusCode >= 200 && statusCode < 300) {
        final remoteData = remoteResult.data ?? [];

        // Save to local if needed
        if (saveToLocal != null) {
          await saveToLocal(remoteData);
        }

        return Right(remoteData.map(mapper).toList());
      } else if (statusCode >= 400 && statusCode < 500) {
        return Left(ClientError(remoteResult.status));
      } else if (statusCode >= 500) {
        return Left(ServerError(remoteResult.status));
      } else {
        return Left(ServerError("Unhandled response: $statusCode"));
      }
    } catch (e) {
      print(e);
      return Left(ServerError(e.toString()));
    }
  }
