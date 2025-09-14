import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goods_app/core/storage/app_state.dart';
import 'package:goods_app/data/datasource/asset_remote_datasource.dart';
import 'package:goods_app/data/datasource/home_remote_datasource.dart';
import 'package:goods_app/data/repositories/location_repositories_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/datasource/location_remote_datasource.dart';
import '../../data/datasource/status_remote_datasource.dart';
import '../../data/repositories/asset_repositories_impl.dart';
import '../../data/repositories/auth_repositories_impl.dart';
import '../../data/repositories/home_repositories_impl.dart';
import '../../data/repositories/status_repositories_impl.dart';
import '../../domain/repositories/asset_repositories.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../domain/repositories/home_repositories.dart';
import '../../domain/repositories/location_repositories.dart';
import '../../domain/repositories/status_repositories.dart';
import '../../domain/usecase/asset_use_case.dart';
import '../../domain/usecase/home_use_case.dart';
import '../../domain/usecase/location_use_case.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../domain/usecase/status_use_case.dart';
import '../../presenter/bloc/asset/asset_cubit.dart';
import '../../presenter/bloc/assetbyloc/asset_by_loc_cubit.dart';
import '../../presenter/bloc/assetbystatus/asset_by_status_cubit.dart';
import '../../presenter/bloc/createasset/create_asset_cubit.dart';
import '../../presenter/bloc/delete_asset/delete_asset_cubit.dart';
import '../../presenter/bloc/detail_asset/detail_asset_cubit.dart';
import '../../presenter/bloc/location/location_cubit.dart';
import '../../presenter/bloc/login/login_cubit.dart';
import '../../presenter/bloc/logout/logout_cubit.dart';
import '../../presenter/bloc/me/me_cubit.dart';
import '../../presenter/bloc/status/status_cubit.dart';
import '../../presenter/bloc/token/token_cubit.dart';
import '../../presenter/bloc/update_asset/update_asset_cubit.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**
   * Network
   */
  sl.registerLazySingleton(() => Dio());

  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => AppState(preferences));

  sl.registerLazySingleton<DioClient>(() => DioClient(sl(), sl()));

  /**
   * RemoteDataSource
   * ...
   */
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<StatusRemoteDatasource>(
    () => StatusRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<LocationRemoteDatasource>(
    () => LocationRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AssetRemoteDatasource>(
    () => AssetRemoteDatasourceImpl(sl()),
  );

  /**
   * Repositories
   * ...
   */
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(sl()));
  sl.registerLazySingleton<StatusRepositories>(
    () => StatusRepositoriesImpl(sl()),
  );
  sl.registerLazySingleton<LocationRepositories>(
    () => LocationRepositoriesImpl(sl()),
  );
  sl.registerLazySingleton<HomeRepositories>(() => HomeRepositoriesImpl(sl()));
  sl.registerLazySingleton<AssetRepositories>(
    () => AssetRepositoriesImpl(sl()),
  );

  /**
   * UseCase
   * ...
   */
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => MeUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => StatusUseCase(sl()));
  sl.registerLazySingleton(() => LocationUseCase(sl()));
  sl.registerLazySingleton(() => AssetByLocUseCase(sl()));
  sl.registerLazySingleton(() => AssetByStatusUseCase(sl()));
  sl.registerLazySingleton(() => DetailAssetUseCase(sl()));
  sl.registerLazySingleton(() => CreateAssetUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAssetUseCase(sl()));
  sl.registerLazySingleton(() => UpdateAssetUseCase(sl()));
  sl.registerLazySingleton(() => GetAssetsUseCase(sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));

  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => TokenCubit(sl()));
  sl.registerFactory(() => MeCubit(sl()));
  sl.registerFactory(() => LogoutCubit(sl()));
  sl.registerFactory(() => AssetByStatusCubit(sl()));
  sl.registerFactory(() => AssetByLocCubit(sl()));
  sl.registerFactory(() => StatusCubit(sl()));
  sl.registerFactory(() => LocationCubit(sl()));
  sl.registerFactory(() => CreateAssetCubit(sl()));
  sl.registerFactory(() => AssetsCubit(sl()));
  sl.registerFactory(() => DetailAssetCubit(sl()));
  sl.registerFactory(() => DeleteAssetCubit(sl()));
  sl.registerFactory(() => UpdateAssetCubit(sl()));
}
