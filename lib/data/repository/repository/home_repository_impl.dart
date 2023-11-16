import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/dataSource/home_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }
}
