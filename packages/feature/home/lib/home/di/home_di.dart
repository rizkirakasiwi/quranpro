import 'package:dependency/auto_injector.dart';
import 'package:home/home/cubit/home_cubit.dart';

final homeModule = AutoInjector(
  tag: 'home_module',
  on: (inject) {
    inject.addLazySingleton(HomeCubit.new);
  },
);
