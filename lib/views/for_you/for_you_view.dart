import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';
import 'package:quick_shop/widgets/custom_card_product.dart';
import 'package:quick_shop/widgets/custom_search.dart';

class ForYouView extends GetView<ForYouController> {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "For You",
          style: AppTextStyles().bold16().copyWith(
                color: Get.theme.primaryColor,
              ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                CustomSearch(
                  text: "Search clothes, laptops or etc",
                  color: Get.theme.scaffoldBackgroundColor,
                  colorText: Get.theme.colorScheme.onSecondary,
                  icon: Assets.imagesSearch,
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GetBuilder<ForYouController>(
                        id: "FilterOptions",
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => controller.goToFilterPage(),
                            child: Container(
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Get.theme.scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: controller.filterContainerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.filter_list_outlined,
                                        color: Get.theme.colorScheme.primary),
                                    SizedBox(width: screenWidth * 0.02),
                                    Text(
                                      "Filter",
                                      style: AppTextStyles()
                                          .semiBold14()
                                          .copyWith(
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: GetBuilder<ForYouController>(
                        id: "SortingOptions",
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => _showSortingOptions(),
                            child: Container(
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Get.theme.scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: controller.sortingContainerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.swap_vert_sharp,
                                        color: Get.theme.colorScheme.primary),
                                    SizedBox(width: screenWidth * 0.02),
                                    Text(
                                      controller.selectedSortOption,
                                      style: AppTextStyles()
                                          .semiBold14()
                                          .copyWith(
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Expanded(child: _buildForYouList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSortingOptions() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Sort By",
                    style: AppTextStyles().semiBold24().copyWith(
                          color: Get.theme.colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ),
            _buildSortOption(
                "Recoomended", controller.selectedSortOption == "Recoomended"),
            const Divider(thickness: 0.3),
            _buildSortOption(
                "Popular", controller.selectedSortOption == "Popular"),
            const Divider(thickness: 0.3),
            _buildSortOption(
                "Newest", controller.selectedSortOption == "Newest"),
            const Divider(thickness: 0.3),
            _buildSortOption("Customer review",
                controller.selectedSortOption == "Customer review"),
            const Divider(thickness: 0.3),
            _buildSortOption("Price: lowest to high",
                controller.selectedSortOption == "Price: lowest to high"),
            const Divider(thickness: 0.3),
            _buildSortOption("Price: highest to low",
                controller.selectedSortOption == "Price: highest to low"),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildSortOption(String title, bool isSelected) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles().medium14().copyWith(
              color: isSelected
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.onSurface,
            ),
      ),
      onTap: () {
        controller.changeSortingContainer(
          color: Get.theme.colorScheme.primary,
          title: title,
        );
        Get.back();
      },
    );
  }

  Widget _buildForYouList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 5.0, // المسافة بين الأعمدة
        mainAxisSpacing: 10.0, // المسافة بين الصفوف
        childAspectRatio: 0.52, // نسبة العرض إلى الارتفاع
      ),
      itemCount: controller.products.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomCardProduct(
            image: controller.products[index].image,
            productName: controller.products[index].productName,
            description: controller.products[index].description,
            originalPrice: controller.products[index].originalPrice,
            discountedPrice: controller.products[index].discountedPrice,
          ),
        );
      },
    );
  }
}
