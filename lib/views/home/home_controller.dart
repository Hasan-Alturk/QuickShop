import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/models/offers.dart';
import 'package:quick_shop/core/repo/home_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/local_notification_controller.dart';
import 'package:quick_shop/core/widgets/custom_card_product.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';

class HomeController extends GetxController {
  HomeController({
    required this.homeRepo,
    required this.notificationController,
  });

  final HomeRepo homeRepo;
  final LocalNotificationController notificationController;

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

  List<CustomCardProduct> products = [
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

  void goToProduct() {
    Get.toNamed("/product");
  }
}
