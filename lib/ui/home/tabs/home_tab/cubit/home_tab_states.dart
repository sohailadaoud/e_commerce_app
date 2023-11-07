abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {
  String loadingMessage;

  HomeTabLoadingState({required this.loadingMessage});
}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  //response or category list
}
