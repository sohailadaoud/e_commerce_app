import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsecure;
  var keyBoardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  TextFieldItem({
    required this.fieldName,
    required this.hintText,
    this.suffixIcon,
    this.isObsecure = false,
    this.validator,
    required this.controller,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        Padding(
            padding: EdgeInsets.only(top: 24, bottom: 20),
            child: TextFormField(
                validator: validator,
                controller: controller,
                obscureText: isObsecure,
                keyboardType: keyBoardType,
                decoration: InputDecoration(
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.greyColor),
                    suffixIcon: suffixIcon))),
      ],
    );
  }
}
