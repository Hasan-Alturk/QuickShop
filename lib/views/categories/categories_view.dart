import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/categories/categories_controller.dart';
import 'package:quick_shop/views/categories/widgets/card_category.dart';
import 'package:quick_shop/views/categories/widgets/card_sub_category_item.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearch(
                icon: Icons.search,
                text: "Search Categories",
              ),
              SizedBox(height: context.screenHeight * 0.012),
              Expanded(
                child: GetBuilder<CategoriesController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          _buildCategoryList(),
                          _buildVerticalDivider(context),
                          _buildSubcategoryList(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: controller.categories.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: screenPadding / 4),
            child: CardCategory(
              image: controller.categories[index],
              categoryName: controller.categoriesNames[index],
              isSelected: controller.selectedCategoryIndex == index,
              onTap: () => controller.selectCategory(index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVerticalDivider(BuildContext context) {
    return VerticalDivider(
      color: Get.theme.colorScheme.onSecondary,
      thickness: 1,
      width: context.screenWidth * 0.05,
    );
  }

  Widget _buildSubcategoryList() {
    return Expanded(
      flex: 8,
      child: ListView(
        children: [
          _buildExpansionTile(title: "Jackets"),
          _buildExpansionTile(title: "Sweater"),
          _buildExpansionTile(title: "Coats"),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({required String title}) {
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
              padding: EdgeInsets.symmetric(vertical: screenPadding / 2),
              child: Wrap(
                spacing: screenPadding,
                runSpacing: screenPadding,
                children: List.generate(
                  controller.subcategories.length,
                  (index) {
                    return CardSubCategoryItem(
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
