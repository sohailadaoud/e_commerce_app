import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';

import '../../entities/CategoryEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
}

abstract class HomeLocalDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
}
