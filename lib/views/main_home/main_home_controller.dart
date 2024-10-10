import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/cart/cart_binding.dart';
import 'package:quick_shop/views/cart/cart_controller.dart';
import 'package:quick_shop/views/categories/categories_binding.dart';
import 'package:quick_shop/views/favourite/favourite_binding.dart';
import 'package:quick_shop/views/favourite/favourite_controller.dart';
import 'package:quick_shop/views/home/home_binding.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/views/profile/profile_binding.dart';
import 'package:quick_shop/views/profile/profile_controller.dart';

class MainHomeController extends GetxController {
  PageController pageController = PageController();

  int pageIndex = 0;
  //bool tokenChecked = false;

  Future<void> changePage(int newPageIndex) async {
    pageIndex = newPageIndex;

    switch (newPageIndex) {
      case 0:
        log("Home");
        HomeBinding().dependencies();

        Get.delete<CategoriesBinding>();
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
        Get.delete<CategoriesBinding>();
        Get.delete<FavouriteController>();
        Get.delete<ProfileController>();
        break;
      case 3:
        log("Favourite");
        FavouriteBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CategoriesBinding>();
        Get.delete<CartController>();
        Get.delete<ProfileController>();
        break;
      case 4:
        log("Profile");
        ProfileBinding().dependencies();
        Get.delete<HomeController>();
        Get.delete<CategoriesBinding>();
        Get.delete<CartController>();
        Get.delete<FavouriteController>();
        break;
    }

    update(["MainHomeViewGetBuilder", "MainHomeViewScreenGetBuilder"]);
  }

  // Future<bool> checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');

  //   if (token != null && token.isNotEmpty) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
