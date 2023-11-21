import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/product_tab/cubit/product_list_states.dart';
import 'package:e_commerce_app/ui/home/tabs/product_tab/cubit/product_lits_view_model.dart';
import 'package:e_commerce_app/ui/home/widget/custom_search_shopping_cart.dart';
import 'package:e_commerce_app/ui/home/widget/grid_view_data_item.dart';
import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductListViewModel viewModel = ProductListViewModel(
    getAllProductsUseCase: injectGetAllProductsUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListViewModel, ProductListTabStates>(
        bloc: viewModel..getProducts(),
        builder: (context, state) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  state is ProductListTabLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: viewModel.productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.4,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  // Navigator.of(context).pushNamed(
                                  //     ProductDetailsView.routeName,
                                  //     arguments: viewModel.productList[index]);
                                },
                                child: GridViewCardItem(
                                    productEntity:
                                        viewModel.productList[index]),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
          ));
        });
  }
}

//
//
//
// BlocBuilder<ProductListViewModel, ProductListTabStates>(
// bloc: viewModel,
// builder: (context, state) {
// return SafeArea(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: 30.h,
// ),
// Image.asset(
// 'assets/images/logo.png',
// ),
// SizedBox(
// height: 10.h,
// ),
// const CustomSearchAndShoppingCart(),
// SizedBox(
// height: 10.h,
// ),
// state is ProductListTabLoadingState
// ? const Center(
// child: CircularProgressIndicator(
// color: AppColors.primaryColor,
// ),
// )
//     : Expanded(
// child: GridView.builder(
// itemCount: viewModel.productList.length,
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 2 / 2.4,
// crossAxisSpacing: 16.w,
// mainAxisSpacing: 16.h),
// itemBuilder: (context, index) {
// return InkWell(
// splashColor: Colors.transparent,
// hoverColor: Colors.transparent,
// highlightColor: Colors.transparent,
// onTap: () {
// // Navigator.of(context).pushNamed(
// //     ProductDetailsView.routeName,
// //     arguments: viewModel.productList[index]);
// },
// child: GridViewCardItem(
// productEntity:
// viewModel.productList[index]),
// );
// },
// ),
// )
// ],
// ),
// ),
// ));
// });
//
// SafeArea(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: 30.h,
// ),
// Image.asset(
// 'assets/images/logo.png',
// ),
// SizedBox(
// height: 10.h,
// ),
// const CustomSearchAndShoppingCart(),
// SizedBox(
// height: 10.h,
// ),
// ],
// ),
// ),
// ));
