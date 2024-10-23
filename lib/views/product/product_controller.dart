import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<bool> selectedColors = List.filled(10, false);
  List<String> selectedSizes = [''];

  List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
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

  void updateSizes(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size); // Remove if already selected
    } else {
      selectedSizes.add(size); // Add if not selected
    }
    update(["size"]); // Trigger update
  }

  void updateColors(int index) {
    selectedColors[index] = !selectedColors[index];
    update(["color"]);
  }
}
