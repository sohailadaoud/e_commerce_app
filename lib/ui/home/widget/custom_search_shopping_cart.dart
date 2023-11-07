import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchAndShoppingCart extends StatelessWidget {
  const CustomSearchAndShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.h),
              hintText: "What do you search for?",
              hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromRGBO(6, 0, 79, 0.6)),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 32.sp,
                  color: AppColors.primaryColor.withOpacity(0.75),
                ),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 1),
              ).copyWith(
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2))),
        )),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ImageIcon(
              AssetImage(
                'assets/images/shopping_cart.png',
              ),
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
