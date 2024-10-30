import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/core/models/product.dart';

class ProductController extends GetxController {
  int currentImage = 0;
  bool isFavorite = false;
  String selectedSize = "Size";
  String selectedColor = "Color";
  Color colorBorderSize = Get.theme.colorScheme.onSecondary;
  Color colorBorderColor = Get.theme.colorScheme.onSecondary;

  late Product product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
    log("Current Product: ${product.title}");
  }

  List<String> colors = [
    "Red",
    "Green",
    "Blue",
    "Black",
    "White",
    "Yellow",
  ];
  List<String> sizes = [
    'X Small',
    'Small',
    'Medium',
    'Larg',
    'X Larg',
    'XX Larg',
    'XXX Larg',
  ];

  List<Product> products = [
    Product(
      images: [
        Assets.imagesArduino,
        Assets.imagesArduino,
        Assets.imagesArduino,
        Assets.imagesArduino,
      ],
      title: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    Product(
      images: [
        Assets.imagesLaptop,
        Assets.imagesLaptop,
        Assets.imagesLaptop,
        Assets.imagesLaptop,
      ],
      title: "laptop",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
    Product(
      images: [
        Assets.imagesBurgur,
        Assets.imagesBurgur,
        Assets.imagesBurgur,
        Assets.imagesBurgur,
      ],
      title: "Burgur",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "150\$",
      discountedPrice: "120\$",
    ),
    Product(
      images: [
        Assets.imagesDress,
        Assets.imagesDress,
        Assets.imagesDress,
        Assets.imagesDress,
      ],
      title: "Dress",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
  ];

  void onImageChange(int index) {
    currentImage = index;
    update(["images"]);
  }

  void updateSize(String size) {
    selectedSize = size;
    colorBorderSize = Get.theme.colorScheme.primary;
    update(["size"]);
  }

  void updateColor(String color) {
    selectedColor = color;
    colorBorderColor = Get.theme.colorScheme.primary;
    update(["color"]);
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    update(["favorite"]);
  }

  void goToRatingReview() {
    Get.toNamed("/rating_review");
  }

  void goToProduct(Product newProduct) {
    Get.toNamed("/product", arguments: newProduct);

    log("Navigating to product: ${newProduct.title}");
  }
}
