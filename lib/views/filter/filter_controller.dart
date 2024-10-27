import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController {
  RangeValues priceRange = const RangeValues(100, 800);
  List<String> selectedColors = [''];
  List<String> selectedSizes = [''];
  List<String> selectedCategories = [''];

  List<String> categories = ['Women', 'Men', 'Boys', 'Girls', 'Kids'];
  List<String> colors = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Purple',
    'Pink',
    'Black',
    'White',
    'Gray',
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
  void updatePriceRange(RangeValues values) {
    priceRange = values;
    update(["price"]);
  }

  void updateColors(String color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color); // Remove if already selected
    } else {
      selectedColors.add(color); // Add if not selected
    }
    update(["color"]); // Trigger update
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
