import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/datasource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/datasource/home_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repositpory_impl.dart';
import 'package:e_commerce_app/domain/useCase/register_use_case.dart';

import '../data/repository/repository/home_repository_impl.dart';
import 'repository/dataSource/auth_remote_data_source.dart';
import 'repository/dataSource/home_remote_data_source.dart';
import 'repository/repository/auth_repository_contract.dart';
import 'repository/repository/home_repository_contract.dart';
import 'useCase/get_all_brands_use_case.dart';
import 'useCase/get_all_category_use_case.dart';
import 'useCase/login_use_case.dart';

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepositoryContract injectionAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectionAuthRepository());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepositoryContract: injectionAuthRepository());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

GetAllCategoryUseCase injectGetAllCategoryUseCase() {
  return GetAllCategoryUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}
