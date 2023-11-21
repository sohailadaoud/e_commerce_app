import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/useCase/get_all_product_use_case.dart';
import 'package:e_commerce_app/ui/home/tabs/product_tab/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListViewModel extends Cubit<ProductListTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductListViewModel({required this.getAllProductsUseCase})
      : super(ProductListTabInitialState());
  List<ProductEntity> productList = [];

  void getProducts() async {
    emit(ProductListTabLoadingState(loadingMessage: 'loading....'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductListTabErrorState(error: l));
    }, (response) {
      productList = response.data ?? [];
      emit(ProductListTabSuccessState(responseEntity: response));
    });
  }

  static ProductListViewModel get(context) => BlocProvider.of(context);
}
