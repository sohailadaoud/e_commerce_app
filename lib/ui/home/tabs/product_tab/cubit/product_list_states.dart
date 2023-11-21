import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

abstract class ProductListTabStates {}

class ProductListTabInitialState extends ProductListTabStates {}

class ProductListTabErrorState extends ProductListTabStates {
  Failures error;

  ProductListTabErrorState({required this.error});
}

class ProductListTabLoadingState extends ProductListTabStates {
  String? loadingMessage;

  ProductListTabLoadingState({required this.loadingMessage});
}

class ProductListTabSuccessState extends ProductListTabStates {
  //response list category
  ProductResponseEntity responseEntity;

  ProductListTabSuccessState({required this.responseEntity});
}
