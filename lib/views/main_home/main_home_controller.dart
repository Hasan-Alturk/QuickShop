import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:quick_shop/views/cart/cart_binding.dart';
import 'package:quick_shop/views/cart/cart_controller.dart';
import 'package:quick_shop/views/categories/categories_binding.dart';
import 'package:quick_shop/views/categories/categories_controller.dart';
import 'package:quick_shop/views/favourite/favourite_binding.dart';
import 'package:quick_shop/views/favourite/favourite_controller.dart';
import 'package:quick_shop/views/home/home_binding.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/views/profile/profile_binding.dart';
import 'package:quick_shop/views/profile/profile_controller.dart';

class MainHomeController extends GetxController {
  PageController pageController = PageController();

  int pageIndex = 0;
  bool userChecked = false;

  @override
  Future<void> onInit() async {
    userChecked = await checkUser();

    super.onInit();
  }

  Future<void> changePage(int newPageIndex) async {
    pageIndex = newPageIndex;

    switch (newPageIndex) {
      case 0:
        log("Home");
        HomeBinding().dependencies();

        Get.delete<CategoriesController>();
        Get.delete<CartController>();
        Get.delete<FavouriteController>();
        Get.delete<ProfileController>();

        break;
      case 1:
        log("Categories");
        CategoriesBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CartController>();
        Get.delete<FavouriteController>();
        Get.delete<ProfileController>();
        break;
      case 2:
        log("Cart");
        CartBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CategoriesController>();
        Get.delete<FavouriteController>();
        Get.delete<ProfileController>();
        break;
      case 3:
        log("Favourite");
        FavouriteBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CategoriesController>();
        Get.delete<CartController>();
        Get.delete<ProfileController>();
        break;
      case 4:
        if (!userChecked) {
          Get.toNamed('/login');
          return;
        }
        log("Profile");

        ProfileBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CategoriesController>();
        Get.delete<CartController>();
        Get.delete<FavouriteController>();
        break;
    }

    update(["main_home_screen", "bottom_navigation_bar"]);
  }

  Future<bool> checkUser() async {
    User? user = await Prefs.getUser();

    if (user == null) {
      userChecked = false;
      return userChecked;
    } else {
      userChecked = true;
      return userChecked;
    }
  }
}
