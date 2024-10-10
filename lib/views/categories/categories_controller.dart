import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class CategoriesController extends GetxController {
  int selectedCategoryIndex = -1; // يبدأ من -1 لتحديد عدم وجود أي عنصر محدد
  String?
      selectedCategoryTitle; // تعريف المتغير الذي يحمل العنوان الحالي المحدد

  void selectCategory(int index) {
    selectedCategoryIndex = index; // تحديث الفهرس المحدد
    update(); // تحديث الواجهة
  }

  // دالة لتحديث التصنيف المحدد بناءً على العنوان
  void selectCategoryByTitle(String? title) {
    selectedCategoryTitle = title;
    update(); // لإعادة بناء الواجهة
  }

  List<String> subcategories = [
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
    Assets.imagesSubCati,
  ];

  List<String> subcategoriesNames = [
    "Fashion",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "Sport",
    "School",
    "Fashion",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "School",
  ];

  List<String> categories = [
    Assets.imagesFashion,
    Assets.imagesElectronics,
    Assets.imagesFood,
    Assets.imagesShoes,
    Assets.imagesSport,
    Assets.imagesSchool,
    Assets.imagesElectronics,
    Assets.imagesFood,
    Assets.imagesShoes,
    Assets.imagesSport,
    Assets.imagesSchool,
    Assets.imagesElectronics,
  ];

  List<String> categoriesNames = [
    "Fashion",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "School",
    "Electronics",
    "Food",
    "Shoes",
    "Sport",
    "School",
    "Electronics",
  ];
}
