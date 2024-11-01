import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'filter_controller.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.screenHeight * 0.012),
                _buildSectionTitle('Price'),
                SizedBox(height: context.screenHeight * 0.012),
                _buildPriceRangeSlider(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildSectionTitle('Category'),
                SizedBox(height: context.screenHeight * 0.012),
                _buildCategoryChips(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildSectionTitle('Color'),
                SizedBox(height: context.screenHeight * 0.012),
                _buildColorChips(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: context.screenHeight * 0.012),
                _buildSectionTitle('Size'),
                SizedBox(height: context.screenHeight * 0.012),
                _buildSizeChips(),
                SizedBox(height: context.screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Filter",
        style: AppTextStyles().bold16().copyWith(
              color: Get.theme.primaryColor,
            ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles()
          .normal16()
          .copyWith(color: Get.theme.colorScheme.secondary),
    );
  }

  Divider _buildDivider() {
    return Divider(color: Get.theme.colorScheme.onSecondary);
  }

  Widget _buildPriceRangeSlider() {
    return GetBuilder<FilterController>(
      id: "price",
      builder: (_) {
        return Column(
          children: [
            RangeSlider(
              values: controller.priceRange,
              min: 0,
              max: 1000,
              onChanged: (RangeValues values) {
                controller.updatePriceRange(values);
              },
              activeColor: Get.theme.colorScheme.primary,
              inactiveColor: Get.theme.colorScheme.onSecondary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${controller.priceRange.start.toInt()}',
                  style: AppTextStyles().normal16().copyWith(
                        color: Get.theme.colorScheme.secondary,
                      ),
                ),
                Text(
                  '\$${controller.priceRange.end.toInt()}',
                  style: AppTextStyles().normal16().copyWith(
                        color: Get.theme.colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoryChips() {
    return GetBuilder<FilterController>(
      id: "category",
      builder: (_) => Wrap(
        spacing: screenPadding,
        runSpacing: screenPadding,
        children: controller.categories.map(
          (category) {
            return ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  color: controller.selectedCategories.contains(category)
                      ? Get.theme.colorScheme.onPrimary
                      : Get.theme.colorScheme.secondary,
                ),
              ),
              showCheckmark: false,
              selectedColor: Get.theme.colorScheme.primary,
              selected: controller.selectedCategories.contains(category),
              onSelected: (bool selected) {
                controller.updateCategories(category);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildColorChips() {
    return GetBuilder<FilterController>(
      id: "color",
      builder: (_) => Wrap(
        spacing: screenPadding,
        runSpacing: screenPadding,
        children: controller.colors.map(
          (color) {
            return ChoiceChip(
              label: Text(
                color,
                style: TextStyle(
                  color: controller.selectedColors.contains(color)
                      ? Get.theme.colorScheme.onPrimary
                      : Get.theme.colorScheme.secondary,
                ),
              ),
              showCheckmark: false,
              selectedColor: Get.theme.colorScheme.primary,
              selected: controller.selectedColors.contains(color),
              onSelected: (bool selected) {
                controller.updateColors(color);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  GetBuilder<FilterController> _buildSizeChips() {
    return GetBuilder<FilterController>(
      id: "size",
      builder: (_) => Wrap(
        spacing: screenPadding,
        runSpacing: screenPadding,
        children: controller.sizes.map(
          (size) {
            return ChoiceChip(
              label: Text(
                size,
                style: TextStyle(
                  color: controller.selectedSizes.contains(size)
                      ? Get.theme.colorScheme.onPrimary
                      : Get.theme.colorScheme.secondary,
                ),
              ),
              showCheckmark: false,
              selectedColor: Get.theme.colorScheme.primary,
              selected: controller.selectedSizes.contains(size),
              onSelected: (bool selected) {
                controller.updateSizes(size);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  GetBuilder<FilterController> _buildActionButtons(BuildContext context) {
    return GetBuilder<FilterController>(
      id: "apply",
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SizedBox(
            width: context.screenWidth,
            height: 50,
            child: CustomButton(
              onPressed: () {},
              text: "Apply",
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
