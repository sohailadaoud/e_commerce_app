import 'package:e_commerce_app/domain/useCase/get_all_category_use_case.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({required this.getAllCategoryUseCase})
      : super(HomeTabInitialState());

//void getCategories()async{
//   emit(HomeTabLoadingState(loadingMessage: 'Loading...'));
//   var either = await getAllCategoryUseCase.invoke();
//   either.fold((l) {
//     emit(HomeTabErrorState(errorMessage: l.errorMessage  ));
//   },
//           (response) {
//        emit(HomeTabSuccessState());
//       }
//   );
// }
}
