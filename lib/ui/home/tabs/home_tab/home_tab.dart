import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/ui/home/widget/AnnouncementSection.dart';
import 'package:e_commerce_app/ui/home/widget/categories_or_brand_section.dart';
import 'package:e_commerce_app/ui/home/widget/custom_search_shopping_cart.dart';
import 'package:e_commerce_app/ui/home/widget/row_widget.dart';
import 'package:e_commerce_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getAllCategoryUseCase: injectGetAllCategoryUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel
          ..getCategories()
          ..getBrands(),
        builder: (context, state) => viewModel.categoriesList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        AnnouncementsSection(),
                        SizedBox(
                          height: 10.h,
                        ),
                        RowWidget(textTitle: 'Categories'),
                        state is HomeTabCategoryLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            : CategoriesOrBrandsSection(
                                list: viewModel.categoriesList),
                        SizedBox(
                          height: 20.h,
                        ),
                        RowWidget(textTitle: 'Brands'),
                        SizedBox(
                          height: 24.h,
                        ),
                        state is HomeTabBrandLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            : CategoriesOrBrandsSection(
                                list: viewModel.brandsList),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
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
              AnnouncementsSection(),
              SizedBox(
                height: 10.h,
              ),
              RowWidget(textTitle: 'Categories'),
            ],
          ),
        ),
      ),
    );
  }
}
