import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
}
