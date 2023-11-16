import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository_contract.dart';

import '../../data/api/failures.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either = await authRepositoryContract.register(
        name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
