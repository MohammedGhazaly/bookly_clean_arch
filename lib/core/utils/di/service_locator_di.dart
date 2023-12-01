import 'package:bookly_clean_arch/core/services/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void createHomeRepoServiceLocator() {
  locator.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: locator.get<ApiService>(),
      ),
    ),
  );
}

void createApiServiceLocator() {
  locator.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
}
