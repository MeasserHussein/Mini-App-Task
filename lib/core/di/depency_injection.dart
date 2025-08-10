import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../featured/product/data/data_source/product_remote_data_source.dart';
import '../../featured/product/data/repos/product_repos_impl.dart';
import '../../featured/product/domain/repos/product_repos.dart';
import '../../featured/product/domain/use_case/details_use_case.dart';
import '../../featured/product/domain/use_case/signup_use_case.dart';
import '../../featured/product/ui/manager/details_cubit/details_cubit.dart';
import '../../featured/product/ui/manager/product_cubit/product_cubit.dart';
import '../dio_client/dio_client.dart';
import '../units/dio_factory.dart';

final getIt =GetIt.instance;
void setupDependencies(){
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  }

  getIt.registerLazySingleton(() => DioClient(getIt()));


  //login
  getIt.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<ProductRepos>(() => ProductReposImpl(getIt()));
  getIt.registerLazySingleton(() => ProductUseCase(getIt()));
  getIt.registerLazySingleton(() => DetailsUseCase(getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));
  getIt.registerFactory(() => DetailsCubit(getIt()));

}