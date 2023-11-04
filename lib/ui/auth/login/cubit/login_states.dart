import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

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
  AuthResultEntity response;

  LoginSuccessState({required this.response});
}
