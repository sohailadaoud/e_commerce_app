import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/utils/dialog_utlis.dart';
import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:e_commerce_app/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtlis.showLoading(context, state.loadingMessage ?? 'waiting');
        } else if (state is LoginErrorState) {
          DialogUtlis.hideLoading(context);
          DialogUtlis.showMessage(context, state.errorMessage!,
              posActionName: 'ok', title: 'error');
        } else if (state is LoginSuccessState) {
          DialogUtlis.hideLoading(context);
          DialogUtlis.showMessage(context, state.response.token!,
              posActionName: 'ok', title: 'success');
        }
      },
      child: Scaffold(
        body: Container(
          color: AppColors.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 50.h, right: 97.w, left: 97.w),
                  child: Image.asset('assets/images/route.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome Back to Route',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Text(
                        'please sign in with your account',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'E-email address',
                                hintText: 'please enter your email ',
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your email';
                                  }
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'please enter valid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'please enter your password',
                                controller: viewModel.passwordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'please enter your password';
                                  }
                                  if (text.length < 6) {
                                    return 'password should be at least 6 characters';
                                  }
                                  return null;
                                },
                                isObsecure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text('Forget Password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.whiteColor),
                            textAlign: TextAlign.end),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                            onPressed: () {
                              viewModel.login();
                            },
                            child: Text(
                              'LogIn',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)))),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            'Do not have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          TextButton(
                            onPressed: () {
                              //navigate to registerscreen
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
                            child: Text('Create Account',
                                style: TextStyle(fontSize: 16)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//================== UI OF LOGIN SCREEN=====================
// Scaffold(
// body: Container(
// color: AppColors.primaryColor,
// height: double.infinity,
// child: SingleChildScrollView(
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.only(
// top: 91.h, bottom: 50.h, right: 97.w, left: 97.w),
// child: Image.asset('assets/images/route.png'),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 16.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// 'Welcome Back to Route',
// style: Theme.of(context)
// .textTheme
//     .titleMedium!
// .copyWith(color: AppColors.whiteColor),
// ),
// Text(
// 'please sign in with your account',
// style: Theme.of(context)
// .textTheme
//     .titleMedium!
// .copyWith(color: AppColors.whiteColor),
// ),
// Padding(
// padding: EdgeInsets.only(top: 40.h),
// child: Form(
// key: viewModel.formKey,
// child: Column(
// children: [
// TextFieldItem(
// fieldName: 'E-email address',
// hintText: 'please enter your email ',
// controller: viewModel.emailController,
// validator: (value) {
// if (value == null || value.trim().isEmpty) {
// return 'please enter your email';
// }
// bool emailValid = RegExp(
// r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//     .hasMatch(value);
// if (!emailValid) {
// return 'please enter valid email';
// }
// return null;
// },
// ),
// TextFieldItem(
// fieldName: 'Password',
// hintText: 'please enter your password',
// controller: viewModel.passwordController,
// validator: (text) {
// if (text == null || text.trim().isEmpty) {
// return 'please enter your password';
// }
// if (text.length < 6) {
// return 'password should be at least 6 characters';
// }
// return null;
// },
// isObsecure: viewModel.isObscure,
// suffixIcon: InkWell(
// child: viewModel.isObscure
// ? Icon(Icons.visibility_off)
// : Icon(Icons.visibility),
// onTap: () {
// if (viewModel.isObscure) {
// viewModel.isObscure = false;
// } else {
// viewModel.isObscure = true;
// }
// setState(() {});
// },
// ),
// ),
// ],
// ),
// ),
// ),
// InkWell(
// onTap: () {},
// child: Text('Forget Password?',
// style: Theme.of(context)
// .textTheme
//     .titleMedium!
// .copyWith(color: AppColors.whiteColor),
// textAlign: TextAlign.end),
// ),
// Padding(
// padding: EdgeInsets.only(top: 35.h),
// child: ElevatedButton(
// onPressed: () {
// viewModel.login();
// },
// child: Text(
// 'LogIn',
// style: Theme.of(context)
// .textTheme
//     .titleLarge!
// .copyWith(color: AppColors.primaryColor),
// ),
// style: ElevatedButton.styleFrom(
// backgroundColor: AppColors.whiteColor,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(80)))),
// ),
// Row(
// //mainAxisAlignment: MainAxisAlignment.center,
// //crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(
// width: MediaQuery.of(context).size.width * 0.2,
// ),
// Text(
// 'Do not have an account?',
// style: Theme.of(context)
// .textTheme
//     .titleMedium!
// .copyWith(color: AppColors.whiteColor),
// ),
// TextButton(
// onPressed: () {
// //navigate to registerscreen
// Navigator.of(context)
//     .pushNamed(RegisterScreen.routeName);
// },
// child: Text('Create Account',
// style: TextStyle(fontSize: 16)),
// )
// ],
// )
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// );
//
