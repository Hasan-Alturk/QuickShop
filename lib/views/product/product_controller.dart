import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class ProductController extends GetxController {
  int currentImage = 0;
  bool isFavorite = false;
  String selectedSize = "Size";
  String selectedColor = "Color";
  Color colorBorderSize = Get.theme.colorScheme.onSecondary;
  Color colorBorderColor = Get.theme.colorScheme.onSecondary;
  List<String> images = [
    Assets.imagesBurgur,
    Assets.imagesArduino,
    Assets.imagesBurgur,
    Assets.imagesLaptop,
  ];
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
