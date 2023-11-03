import 'package:e_commerce_app/domain/useCase/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var emailController = TextEditingController(text: 'sohaila@route.com');
  var nameController = TextEditingController(text: 'sohaila');
  var phoneNumberController = TextEditingController(text: '01283100880');
  var passwordController = TextEditingController(text: '123456789');
  var confirmPasswordController = TextEditingController(text: '123456789');
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(LoadingMessage: 'Loading....'));

      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmPasswordController.text,
          phoneNumberController.text);

      either.fold((l) {
        emit(RegisterErrorState(ErrorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }
  }
}

// Navigator.pushReplacementNamed(
//     context, RegisterScreen.routeName);
