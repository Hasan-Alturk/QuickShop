import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/models/product.dart';

class ForYouController extends GetxController {
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
  }

  List<Product> products = [
    Product(
      images: [
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    Product(
      images: [
        Assets.imagesLaptop,
        Assets.imagesArduino,
        Assets.imagesBurgur,
      ],
      title: "laptop",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
    Product(
      images: [
        Assets.imagesBurgur,
        Assets.imagesArduino,
        Assets.imagesLaptop,
      ],
      title: "Burgur",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "150\$",
      discountedPrice: "120\$",
    ),
    Product(
      images: [
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "Arduino",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "195\$",
      discountedPrice: "130\$",
    ),
    Product(
      images: [
        Assets.imagesDress,
        Assets.imagesArduino,
        Assets.imagesBurgur,
        Assets.imagesLaptop,
      ],
      title: "dress",
      description: "Lorem Ipsum is simply dummy text of the ",
      originalPrice: "15\$",
      discountedPrice: "10\$",
    ),
  ];
}
