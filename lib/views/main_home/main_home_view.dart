import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/cart/cart_view.dart';
import 'package:quick_shop/views/categories/categories_view.dart';
import 'package:quick_shop/views/favourite/favourite_view.dart';
import 'package:quick_shop/views/home/home_view.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';
import 'package:quick_shop/views/profile/profile_view.dart';
import 'package:quick_shop/core/widgets/custom_bottom_navigation_bar.dart';

class MainHomeView extends GetView<MainHomeController> {
  MainHomeView({super.key});
  final screens = [
    const HomeView(),
    const CategoriesView(),
    const CartView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: GetBuilder<MainHomeController>(
          id: "MainHomeViewScreenGetBuilder",
          builder: (_) {
            return screens[controller.pageIndex];
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<MainHomeController>(
        id: "MainHomeViewGetBuilder",
        builder: (_) {
          return CustomBottomNavigationBar(
            currentIndex: controller.pageIndex,
            onTap: controller.changePage,
          );
        },
      ),
    );
  }
}
