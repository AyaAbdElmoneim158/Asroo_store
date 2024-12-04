import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../app/cubit/app_cubit.dart';
import '../utils/services/graphql/api_service.dart';
import '../utils/services/graphql/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
