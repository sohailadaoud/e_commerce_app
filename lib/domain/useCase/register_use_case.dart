import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/repository/auth_repository/repository/auth_repositpory_impl.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../data/api/base_error.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either = await authRepositoryContract.register(
        name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepositoryContract: injectionAuthRepository());
}
