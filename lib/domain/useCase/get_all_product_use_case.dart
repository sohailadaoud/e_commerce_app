import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository_contract.dart';

class GetAllProductsUseCase {
  // repository
  HomeRepositoryContract repositoryContract;

  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repositoryContract.getAllProducts();
  }
}
