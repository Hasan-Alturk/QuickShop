import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/widgets/custom_card_product.dart';

class PopularController extends GetxController {
  String selectedSortOption = "Sorting";
  Color sortingContainerColor = Get.theme.colorScheme.onSecondary;
  Color filterContainerColor = Get.theme.colorScheme.onSecondary;

  void changeSortingContainer({
    required Color color,
    required String title,
  }) {
    sortingContainerColor = color;
    selectedSortOption = title;
    update(["SortingOptions"]);
  }

  void changeFilterContainer({
    required Color color,
  }) {
    filterContainerColor = color;
    update(["FilterOptions"]);
  }

  void goToFilter() {
    Get.toNamed("/filter");
  }

  void goToProduct() {
    Get.toNamed("/product");
    log("message");
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
}
