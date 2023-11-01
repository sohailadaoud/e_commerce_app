import 'package:e_commerce_app/data/repository/auth_repository/auth_repository_contract.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  AuthRepositoryContract repositoryContract;

  RegisterScreenViewModel({required this.repositoryContract})
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
      try {
        var response = await repositoryContract.register(
            nameController.text,
            emailController.text,
            passwordController.text,
            confirmPasswordController.text,
            phoneNumberController.text);
        if (response.message != 'success') {
          emit(RegisterErrorState(ErrorMessage: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(ErrorMessage: e.toString()));
      }
    }
  }
}

// Navigator.pushReplacementNamed(
//     context, RegisterScreen.routeName);
