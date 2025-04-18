import 'package:home/home/cubit/home_cubit.dart';
import 'package:injector/injector.dart';

extension HomeDi on Injector {
  void injectHome() {
    registerSingleton(() => HomeCubit(get()));
  }
}