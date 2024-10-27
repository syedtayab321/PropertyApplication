import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import '../Controllers/BottomBarController.dart';
class DashboardPage extends StatelessWidget {
  final BottomBarController _controller = Get.put(BottomBarController());
  DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _controller.pages[_controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return FloatingNavbar(
          onTap: (int val) {
            _controller.onItemTapped(val);
          },
          currentIndex: _controller.selectedIndex.value,
          iconSize: 20,
          fontSize: 10.1,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          padding: const EdgeInsets.only(bottom: 8,top: 6),
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          selectedBackgroundColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            FloatingNavbarItem(icon: FontAwesomeIcons.houseMedical, title: 'Home'),
            FloatingNavbarItem(icon: FontAwesomeIcons.searchengin, title: 'search'),
            FloatingNavbarItem(icon: FontAwesomeIcons.heart, title: 'Favourite'),
            FloatingNavbarItem(icon: FontAwesomeIcons.peopleRoof, title: 'Settings'),
          ],
        );
      }),
    );
  }
}