import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:e_commerce_app/utils/dialog_utlis.dart';
import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:e_commerce_app/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var viewModel = RegisterScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtlis.showLoading(context, state.LoadingMessage ?? 'waiting');
        } else if (state is RegisterErrorState) {
          DialogUtlis.hideLoading(context);
          DialogUtlis.showMessage(context, state.ErrorMessage!,
              posActionName: 'ok', title: 'error');
        } else if (state is RegisterSuccessState) {
          DialogUtlis.hideLoading(context);
          DialogUtlis.showMessage(context, state.response.user?.name ?? '',
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
                      top: 70.h, bottom: 50.h, right: 97.w, left: 97.w),
                  child: Image.asset('assets/images/route.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                  fieldName: 'Full Name',
                                  hintText: 'please enter your full name',
                                  controller: viewModel.nameController),
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
                              TextFieldItem(
                                fieldName: 'Confirm password',
                                hintText: 'please confirm your password',
                                keyBoardType: TextInputType.number,
                                controller: viewModel.confirmPasswordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'please confirm your password';
                                  }
                                  if (text !=
                                      viewModel.passwordController.text) {
                                    return 'password doesnt match';
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
                                // isPassword: true,
                              ),
                              TextFieldItem(
                                fieldName: 'Mobile Number',
                                hintText: 'please enter your mobile number',
                                keyBoardType: TextInputType.number,
                                controller: viewModel.phoneNumberController,
                                validator: (text) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                            onPressed: () {
                              viewModel.register();
                              // if (viewModel.formKey.currentState!.validate()) {
                              //   Navigator.pushReplacementNamed(
                              //       context, RegisterScreen.routeName);
                              // }
                            },
                            child: Text(
                              'Sign Up',
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
                      TextButton(
                          onPressed: () {
                            //navigate to loginscreen
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                          },
                          child: Text('already have an account?'))
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

//======================================

//
// Scaffold(
// body: Container(
// color: AppColors.primaryColor,
// height: double.infinity,
// child: SingleChildScrollView(
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.only(
// top: 70.h, bottom: 50.h, right: 97.w, left: 97.w),
// child: Image.asset('assets/images/route.png'),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 16.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Padding(
// padding: EdgeInsets.only(top: 5.h),
// child: Form(
// key: formKey,
// child: Column(
// children: [
// TextFieldItem(
// fieldName: 'Full Name',
// hintText: 'please enter your full name',
// controller: nameController),
// TextFieldItem(
// fieldName: 'E-email address',
// hintText: 'please enter your email ',
// controller: emailController,
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
// controller: passwordController,
// validator: (text) {
// if (text == null || text.trim().isEmpty) {
// return 'please enter your password';
// }
// if (text.length < 6) {
// return 'password should be at least 6 characters';
// }
// return null;
// },
// isObsecure: isObscure,
// suffixIcon: InkWell(
// child: isObscure
// ? Icon(Icons.visibility_off)
// : Icon(Icons.visibility),
// onTap: () {
// if (isObscure) {
// isObscure = false;
// } else {
// isObscure = true;
// }
// setState(() {});
// },
// ),
// ),
// TextFieldItem(
// fieldName: 'Confirm password',
// hintText: 'please confirm your password',
// keyBoardType: TextInputType.number,
// controller: confirmPasswordController,
// validator: (text) {
// if (text == null || text.trim().isEmpty) {
// return 'please confirm your password';
// }
// if (text != passwordController.text) {
// return 'password doesnt match';
// }
//
// return null;
// },
// // isPassword: true,
// ),
// TextFieldItem(
// fieldName: 'Mobile Number',
// hintText: 'please enter your mobile number',
// keyBoardType: TextInputType.number,
// controller: phoneNumberController,
// validator: (text) {
// return null;
// },
// ),
// ],
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 35.h),
// child: ElevatedButton(
// onPressed: () {
// if (formKey.currentState!.validate()) {
// Navigator.pushReplacementNamed(
// context, RegisterScreen.routeName);
// }
// },
// child: Text(
// 'Sign Up',
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
// TextButton(
// onPressed: () {
// //navigate to loginscreen
// Navigator.of(context)
//     .pushNamed(LoginScreen.routeName);
// },
// child: Text('already have an account?'))
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// );
