import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryRowWidget extends StatelessWidget {
  String textTitle;

  CategoryRowWidget({required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.darkPrimaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  )),
          InkWell(
            onTap: () {},
            child: Text('view all',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.darkPrimaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    )),
          )
        ],
      ),
    );
  }
}
