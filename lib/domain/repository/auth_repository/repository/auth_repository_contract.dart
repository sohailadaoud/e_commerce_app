import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import '../../../../data/api/base_error.dart';

abstract class AuthRepositoryContract {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  login(String email, String password);
}
