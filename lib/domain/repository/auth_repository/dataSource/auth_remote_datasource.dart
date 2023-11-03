import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/base_error.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
