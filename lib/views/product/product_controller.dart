import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class ProductController extends GetxController {
  int currentImage = 0;

  String selectedSize = "Size";
  Color colorBorderSize = Get.theme.colorScheme.onSecondary;
  final List<String> images = [
    Assets.imagesBurgur,
    Assets.imagesArduino,
    Assets.imagesLaptop,
  ];
  List<bool> selectedColors = List.filled(10, false);

  void onImageChange(int index) {
    currentImage = index;
    update(["images"]);
  }

  List<String> sizes = [
    'X Small',
    'Small',
    'Medium',
    'Larg',
    'X Larg',
    'XX Larg',
    'XXX Larg'
  ];
  final colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  void updateSize(String size) {
    selectedSize = size;
    colorBorderSize = Get.theme.colorScheme.primary;
    update(["size"]); // Trigger update
  }

  void updateColors(int index) {
    selectedColors[index] = !selectedColors[index];
    update(["color"]);
  }
}
