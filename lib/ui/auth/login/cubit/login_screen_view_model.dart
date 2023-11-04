import 'package:e_commerce_app/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginScreenViewModel() : super(LoginInitialState());

  //hold data - handle data
  var emailController = TextEditingController(text: 'sohaila@route.com');
  var passwordController = TextEditingController(text: '123456789');
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login() {
    if (formKey.currentState?.validate() == true) {
      //login
    }
  }
}
