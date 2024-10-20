import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ForYouController extends GetxController {
  String selectedSortOption = "Sorting";
  Color sortingContainerColor = Get.theme.colorScheme.primaryContainer;
  Color filterContainerColor = Get.theme.colorScheme.primaryContainer;

  void changeSortingContainer({
    required Color color,
    required String title,
  }) {
    sortingContainerColor = color;
    selectedSortOption = title;
    update(["SortingOptions"]);
  }
}
