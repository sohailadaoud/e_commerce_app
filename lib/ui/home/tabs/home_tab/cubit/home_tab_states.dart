import 'package:e_commerce_app/domain/entities/CategoryEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabCategoryLoadingState extends HomeTabStates {
  String loadingMessage;

  HomeTabCategoryLoadingState({required this.loadingMessage});
}

class HomeTabCategoryErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabCategoryErrorState({required this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabStates {
  //response or category list

  CategoryOrBrandResponseEntity responseEntity;

  HomeTabCategorySuccessState({required this.responseEntity});
}

class HomeTabBrandLoadingState extends HomeTabStates {
  String loadingMessage;

  HomeTabBrandLoadingState({required this.loadingMessage});
}

class HomeTabBrandErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabBrandErrorState({required this.errorMessage});
}

class HomeTabBrandSuccessState extends HomeTabStates {
  //response or category list

  CategoryOrBrandResponseEntity responseEntity;

  HomeTabBrandSuccessState({required this.responseEntity});
}
