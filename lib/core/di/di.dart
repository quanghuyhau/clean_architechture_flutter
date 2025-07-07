import 'package:clean_architechture_flutter/core/api_config.dart';
import 'package:clean_architechture_flutter/data/data_source/coin_api_service.dart';
import 'package:clean_architechture_flutter/data/repository/coin_repository_impl.dart';
import 'package:clean_architechture_flutter/domain/repository/coin_repository.dart';
import 'package:clean_architechture_flutter/domain/use_case/coin_use_case.dart';
import 'package:clean_architechture_flutter/presentation/coin/cubit/coin_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // Retrofit
  sl.registerLazySingleton<CoinApiService>(
        () => CoinApiService(
      sl<Dio>(),
      baseUrl: ApiConfig.getBaseUrl(isProd: true),
    ),
  );

  // Repository
  sl.registerLazySingleton<CoinRepository>(
        () => CoinRepositoryImpl(sl()),
  );
  // RepositoryImpl
  sl.registerLazySingleton<CoinRepositoryImpl>(()  => CoinRepositoryImpl(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetTopCoins(sl()));

  // Cubit
  sl.registerFactory(() => CoinCubit(getTopCoins: sl()));
}
