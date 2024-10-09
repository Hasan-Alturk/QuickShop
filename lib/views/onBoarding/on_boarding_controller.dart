import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/items_on_boarding.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int currentPage = 0;

  List<ItemsOnBoarding> items = [
    ItemsOnBoarding(
      image: Assets.imagesOnBoarding1,
      title: "Shop Everything You Need in One Place",
      subTitle:
          "Discover a wide range of clothing, electronics, and more all available in our all in one store.\nWhatever you're looking for, you'll find it here with ease.",
    ),
    ItemsOnBoarding(
      image: Assets.imagesOnBoarding2,
      title: "Fast and Secure Delivery to Your Doorstep",
      subTitle:
          "No need to worry about delivery we offer fast and secure shipping to ensure your purchases reach you as quickly as possible, wherever you are.",
    ),
    ItemsOnBoarding(
      image: Assets.imagesOnBoarding3,
      title: "Flexible Payment Options for Everyone",
      subTitle:
          "Choose from a variety of payment options that suit your needs, whether you prefer cash on delivery or secure online payments via credit or debit cards.",
    ),
  ];

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void goToNextPage() {
    if (currentPage < items.length - 1) {
      currentPage++;

      pageController.jumpToPage(currentPage);
      update();
    } else {
      //   Get.offAllNamed('/home');
      Get.offAllNamed("/login");
    }
  }

  void goToLogin() {
    Get.offAllNamed("/login");
  }

  void goToHome() {
    // Get.offAllNamed("/home");
    //  Get.offAllNamed("/login");
  }
}
