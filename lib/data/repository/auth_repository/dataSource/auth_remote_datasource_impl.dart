import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/api/base_error.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/dataSource/auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthRegisterEntity());
    });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
