import 'package:envied/envied.dart';

part 'get_env.g.dart';

@Envied(
  path: ".env", 
  obfuscate: true,
  useConstantCase: true,
  name: 'Env',
  )
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'BASE_URL_ALT', obfuscate: true)
  static String baseUrlAlt = _Env.baseUrlAlt;
}

@Envied(
  path: ".env.dev", 
  obfuscate: true,
  useConstantCase: true,
  name: 'EnvDev',
  )
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String baseUrl = _EnvDev.baseUrl;

  @EnviedField(varName: 'BASE_URL_ALT', obfuscate: true)
  static String baseUrlAlt = _EnvDev.baseUrlAlt;
}