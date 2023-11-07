import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repositpory_impl.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectionAuthRepository());
}
