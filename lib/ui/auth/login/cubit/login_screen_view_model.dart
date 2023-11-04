import 'package:e_commerce_app/domain/useCase/login_use_case.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  //hold data - handle data
  var emailController = TextEditingController(text: 'sohaila@route.com');
  var passwordController = TextEditingController(text: '123456789');
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      //login
      emit(LoginLoadingState(loadingMessage: 'loading.......'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
