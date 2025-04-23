import 'package:dependency/auto_injector.dart';
import 'package:network/core/network_client.dart';
import 'package:network/library/http_network_client.dart';

final networkModule = AutoInjector(
  tag: 'network_module',
  on: (inject) {
    inject.addLazySingleton<NetworkClient>(HttpNetworkClient.new);
  },
);
