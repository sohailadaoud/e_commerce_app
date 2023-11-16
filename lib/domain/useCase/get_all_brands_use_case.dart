import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase {
  //repository
  HomeRepositoryContract repositoryContract;

  GetAllBrandsUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getAllBrands();
  }
}
