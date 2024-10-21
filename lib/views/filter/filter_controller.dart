import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController {
  RangeValues priceRange = const RangeValues(100, 800);
  List<bool> selectedColors = List.filled(10, false);
  List<String> selectedSizes = [''];
  List<String> selectedCategories = [''];

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
  void updatePriceRange(RangeValues values) {
    priceRange = values;
    update(["price"]);
  }

  void updateColors(int index) {
    selectedColors[index] = !selectedColors[index];
    update(["color"]);
  }

  void updateSizes(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size); // Remove if already selected
    } else {
      selectedSizes.add(size); // Add if not selected
    }
    update(["size"]); // Trigger update
  }

  void updateCategories(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category); // Remove if already selected
    } else {
      selectedCategories.add(category); // Add if not selected
    }
    update(["category"]); // Trigger update
  }
}
