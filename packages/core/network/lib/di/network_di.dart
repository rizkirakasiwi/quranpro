import 'package:injector/injector.dart';
import 'package:network/core/network_client.dart';
import 'package:network/library/http_network_client.dart';
import 'package:network/logger/logger.dart';
import 'package:network/logger/logger_impl.dart';

extension NetworkDi on Injector {
  void injectNetwork() {
    registerSingleton<NetworkClient>(() => HttpNetworkClient());
  }
}
