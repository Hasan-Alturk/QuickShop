import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/models/product.dart';

class ProductController extends GetxController {
  int currentImage = 0;
  bool isFavorite = false;
  String selectedSize = "Size";
  String selectedColor = "Color";
  Color colorBorderSize = Get.theme.colorScheme.onSecondary;
  Color colorBorderColor = Get.theme.colorScheme.onSecondary;

  Product product = Product(
    images: [
      Assets.imagesBurgur,
      Assets.imagesArduino,
      Assets.imagesBurgur,
      Assets.imagesLaptop,
    ],
    title: "Burgur",
    description:
        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
    originalPrice: "\$12.99",
    discountedPrice: "\$45.99",
    rating: 5,
  );

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
}
