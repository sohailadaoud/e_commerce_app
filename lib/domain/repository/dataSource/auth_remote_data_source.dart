import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
