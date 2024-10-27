import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyapp/screens/DashboardScreens/FavouriteScreen.dart';
import 'package:propertyapp/screens/DashboardScreens/HomePageScreen.dart';
import 'package:propertyapp/screens/DashboardScreens/PropertySearchScreen.dart';

class BottomBarController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    PropertySearchScreen(),
    FavoritePropertiesScreen(),
    FavoritePropertiesScreen(),
  ];
}