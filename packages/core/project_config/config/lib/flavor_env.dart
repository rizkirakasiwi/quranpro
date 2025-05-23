import 'package:config/flavor.dart';
import 'package:config/env/get_env.dart';

class FlavorEnv {
  const FlavorEnv._();

  static String baseUrl = switch (FlavorConfig.flavor) {
    Flavor.dev => EnvDev.baseUrl,
    Flavor.prod => Env.baseUrl,
    _ => EnvDev.baseUrl,
  };

  static String baseUrlAlt = switch (FlavorConfig.flavor) {
    Flavor.dev => EnvDev.baseUrlAlt,
    Flavor.prod => Env.baseUrlAlt,
    _ => EnvDev.baseUrlAlt,
  };
}
