abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginStates {
  String? loadingMessage;

  LoginLoadingState({required this.loadingMessage});
}

class LoginSuccessState extends LoginStates {
  //response
}
