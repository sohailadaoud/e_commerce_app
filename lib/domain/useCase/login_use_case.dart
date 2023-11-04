import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/base_error.dart';
import 'package:e_commerce_app/data/repository/auth_repository/repository/auth_repositpory_impl.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectionAuthRepository());
}
