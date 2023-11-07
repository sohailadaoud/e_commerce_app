import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/data/repository/datasource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/domain/repository/dataSource/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository_contract.dart';

import '../../../domain/entities/AuthResultEntity.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}

AuthRepositoryContract injectionAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}
