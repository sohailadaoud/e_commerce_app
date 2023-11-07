import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customBottomNavigationBar(
    {required int index,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
                  index == 0 ? AppColors.primaryColor : AppColors.whiteColor,
              backgroundColor:
                  index == 0 ? AppColors.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp, AssetImage('assets/images/home_icon.png')),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
                  index == 1 ? AppColors.primaryColor : AppColors.whiteColor,
              backgroundColor:
                  index == 1 ? AppColors.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp, AssetImage('assets/images/category_icon.png')),
            ),
            label: 'category'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
                  index == 2 ? AppColors.primaryColor : AppColors.whiteColor,
              backgroundColor:
                  index == 2 ? AppColors.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp, AssetImage('assets/images/fav_icon.png')),
            ),
            label: 'wishlist'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
                  index == 3 ? AppColors.primaryColor : AppColors.whiteColor,
              backgroundColor:
                  index == 3 ? AppColors.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp, AssetImage('assets/images/account.png')),
            ),
            label: 'account'),
      ],
    ),
  );
}
