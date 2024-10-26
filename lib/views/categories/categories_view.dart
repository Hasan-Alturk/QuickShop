import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/categories/categories_controller.dart';
import 'package:quick_shop/core/widgets/custom_card_category.dart';
import 'package:quick_shop/core/widgets/custom_card_sub_category_item.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.012),
              const CustomSearch(
                icon: Icons.search,
                text: "Search Categories",
              ),
              SizedBox(height: screenHeight * 0.012),
              GetBuilder<CategoriesController>(
                builder: (_) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildCategoryList(),
                          ),
                          VerticalDivider(
                            color: Get.theme.colorScheme.onSecondary,
                            thickness: 1,
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            flex: 8,
                            child: _buildSubcategoryList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return ListView.builder(
      itemCount: controller.categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CustomCardCategory(
            image: controller.categories[index],
            categoryName: controller.categoriesNames[index],
            isSelected: controller.selectedCategoryIndex == index,
            onTap: () => controller.selectCategory(index),
          ),
        );
      },
    );
  }

  Widget _buildSubcategoryList() {
    return ListView(
      children: [
        _buildExpansionTile(title: "Jackets"),
        _buildExpansionTile(title: "Sweater"),
        _buildExpansionTile(title: "Coats"),
      ],
    );
  }

  Widget _buildExpansionTile({
    required String title,
  }) {
    return GetBuilder<CategoriesController>(
      builder: (_) {
        return ExpansionTile(
          iconColor: Get.theme.colorScheme.primary,
          collapsedIconColor: Get.theme.colorScheme.onSurface,
          title: Text(
            title,
            style: AppTextStyles().medium12().copyWith(
                  color: controller.selectedCategoryTitle == title
                      ? Get.theme.colorScheme.secondary
                      : Get.theme.colorScheme.onSurface,
                ),
          ),
          onExpansionChanged: (bool expanded) {
            controller.selectCategoryByTitle(expanded ? title : null);
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 12.0, // المسافة الأفقية بين العناصر
                runSpacing: 12.0, // المسافة العمودية بين الصفوف
                children: List.generate(
                  controller.subcategories.length,
                  (index) {
                    return CustomCardSubCategoryItem(
                      image: controller.subcategories[index],
                      categoryName: controller.subcategoriesNames[index],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
