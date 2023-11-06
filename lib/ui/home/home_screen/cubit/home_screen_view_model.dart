import 'package:e_commerce_app/ui/home/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/ui/home/tabs/favourite_tab/favourite_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/product_tab/product_list_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  void changeBottomNavigationBar(int newSelectedIndex) {
    HomeInitialState();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
