import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/models/offers.dart';
import 'package:quick_shop/core/models/product.dart';
import 'package:quick_shop/core/repo/home_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/local_notification_controller.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';

class HomeController extends GetxController {
  HomeController({
    required this.mainController,
    required this.homeRepo,
    required this.notificationController,
  });

  final HomeRepo homeRepo;
  final LocalNotificationController notificationController;
  final MainHomeController mainController;

  bool isLoading = false;
  bool isLoadingOffers = false;

  final List<Widget> offersImages = [];

  @override
  void onInit() {
    super.onInit();
    getOffers();
  }

  final CarouselSliderController carouselController =
      CarouselSliderController();

  int currentPage = 0;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentPage = index;
    update(["offers"]);
  }

  Future<void> getOffers() async {
    try {
      isLoadingOffers = true;
      update(["offers"]);
      Offers offers = await homeRepo.getOffers();
      for (Offer offer in offers.data) {
        offersImages.add(
          CachedNetworkImage(
            imageUrl: offer.xxlargeUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      }

      isLoadingOffers = false;
      update(["offers"]);
    } on ErrorHandler catch (e) {
      isLoadingOffers = false;
      update(["offers"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  List<Product> products = [
    Product(
      images: [
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    Product(
      images: [
        Assets.imagesLaptop,
        Assets.imagesArduino,
        Assets.imagesBurgur,
      ],
      title: "laptop",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
    Product(
      images: [
        Assets.imagesBurgur,
        Assets.imagesArduino,
        Assets.imagesLaptop,
      ],
      title: "Burgur",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "150\$",
      discountedPrice: "120\$",
    ),
    Product(
      images: [
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    Product(
      images: [
        Assets.imagesDress,
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "dress",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
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
    mainController.changePage(1);
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

  void goToProduct() {
    Get.toNamed("/product");
    log("message");
  }
}
