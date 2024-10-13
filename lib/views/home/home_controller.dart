import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/services/local_notification_controller.dart';
import 'package:quick_shop/widgets/custom_card_product.dart';

class HomeController extends GetxController {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  final LocalNotificationController notificationController =
      Get.put(LocalNotificationController());

  int selectedCategoryIndex = -1; // يبدأ من -1 لتحديد عدم وجود أي عنصر محدد
  void selectCategory(int index) {
    selectedCategoryIndex = index; // تحديث الفهرس المحدد
    update(); // تحديث الواجهة
  }

  int currentPage = 0;

  void updatePageIndex(int index) {
    currentPage = index;
    update();
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentPage = index;
    update();
  }

  List<CustomCardProduct> products = [
    const CustomCardProduct(
      image: Assets.imagesArduino,
      productName: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    const CustomCardProduct(
      image: Assets.imagesBurgur,
      productName: "Burgur",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "45\$",
      discountedPrice: "20\$",
    ),
    const CustomCardProduct(
      image: Assets.imagesLaptop,
      productName: "Laptop",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "90\$",
      discountedPrice: "60\$",
    ),
    const CustomCardProduct(
      image: Assets.imagesMadrb,
      productName: "Madrb",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "500\$",
      discountedPrice: "210\$",
    ),
    const CustomCardProduct(
      image: Assets.imagesDress,
      productName: "Dress",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "50\$",
      discountedPrice: "30\$",
    ),
  ];
  List<Widget> items = [
    Image.asset(Assets.imagesOffer),
    Image.asset(Assets.imagesOffer2),
    Image.asset(Assets.imagesOffer),
    Image.asset(Assets.imagesOffer2),
    Image.asset(Assets.imagesOffer),
  ];

  List<String> categories = [
    Assets.imagesFashion,
    Assets.imagesElectronics,
    Assets.imagesFood,
    Assets.imagesShoes,
    Assets.imagesSport,
    Assets.imagesSchool,
    Assets.imagesElectronics,
    Assets.imagesFood,
    Assets.imagesShoes,
    Assets.imagesSport,
    Assets.imagesSchool,
    Assets.imagesElectronics,
  ];

  List<String> categoriesNames = [
    "Fashion",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "School",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "School",
    "Electronics",
  ];
  void goToOffers() {
    Get.toNamed("/offers");
  }

  void goToCategories() {
    Get.toNamed("/categories");
  }

  void goToFlashSale() {
    Get.toNamed("/flash_sale");
  }

  void goToForYou() {
    Get.toNamed("/for_you");
  }

  void goToPopular() {
    Get.toNamed("/popular");
  }
}
