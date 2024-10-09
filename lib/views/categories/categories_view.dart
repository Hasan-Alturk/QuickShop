import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/app_sizes.dart';
import 'package:quick_shop/views/categories/categories_controller.dart';
import 'package:quick_shop/widgets/custom_card_category.dart';
import 'package:quick_shop/widgets/custom_card_sub_category_item.dart';
import 'package:quick_shop/widgets/custom_search.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);

    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const CustomSearch(
                text: "Search Categories",
                color: AppColors.nonActiveColor,
                colorText: AppColors.grayColor,
                icon: Assets.imagesSearch,
              ),
              const SizedBox(height: 12),
              GetBuilder<CategoriesController>(builder: (_) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildCategoryList(),
                        ),
                        const VerticalDivider(
                          color: AppColors.grayColor, // لون الخط
                          thickness: 1, // سمك الخط
                          width: 15, // المسافة حول الخط
                        ),
                        Expanded(
                          flex: 8,
                          child: _buildSubcategoryList(context: context),
                        ),
                      ],
                    ),
                  ),
                );
              }),
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

  Widget _buildSubcategoryList({required BuildContext context}) {
    return ListView(
      children: [
        _buildExpansionTile(title: "Jackets", context: context),
        _buildExpansionTile(title: "Sweater", context: context),
        _buildExpansionTile(title: "Coats", context: context),
      ],
    );
  }

  Widget _buildExpansionTile(
      {required String title, required BuildContext context}) {
    return GetBuilder<CategoriesController>(
      builder: (_) {
        return ExpansionTile(
          // هنا نغير الواجهة بناءً على حالة expanded
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.secondryTextColor,
          title: Text(
            title,
            style: AppTextStyles().medium12(context).copyWith(
                  color: controller.selectedCategoryTitle == title
                      ? AppColors.darkColor
                      : AppColors.secondryTextColor,
                ),
          ),
          onExpansionChanged: (bool expanded) {
            controller.selectCategoryByTitle(expanded ? title : null);
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 15.0, // المسافة الأفقية بين العناصر
                runSpacing: 15.0, // المسافة العمودية بين الصفوف
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
