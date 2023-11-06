import 'package:e_commerce_app/ui/home/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/ui/home/home_screen/widget/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: customBottomNavigationBar(
            context: context,
            index: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.changeBottomNavigationBar(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
