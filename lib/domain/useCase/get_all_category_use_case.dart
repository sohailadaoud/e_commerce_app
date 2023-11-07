import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository_contract.dart';

class GetAllCategoryUseCase {
  //repository
  HomeRepositoryContract repositoryContract;

  GetAllCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return repositoryContract.getAllCategories();
  }
}
