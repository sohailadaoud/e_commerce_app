abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? LoadingMessage;

  RegisterLoadingState({required this.LoadingMessage});
}

class RegisterInitialState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? ErrorMessage;

  RegisterErrorState({required this.ErrorMessage});
}

class RegisterSuccessState extends RegisterStates {}
