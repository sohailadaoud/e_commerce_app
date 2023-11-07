import 'package:e_commerce_app/ui/home/widget/custom_search_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Image.asset(
            'assets/images/logo.png',
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomSearchAndShoppingCart(),
        ],
      ),
    );
  }
}
