import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'filter_controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.012),
                _buildSectionTitle('Price'),
                SizedBox(height: screenHeight * 0.012),
                _buildPriceRangeSlider(),
                SizedBox(height: screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: screenHeight * 0.012),
                _buildSectionTitle('Category'),
                SizedBox(height: screenHeight * 0.012),
                _buildCategoryChips(),
                SizedBox(height: screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: screenHeight * 0.012),
                _buildSectionTitle('Color'),
                SizedBox(height: screenHeight * 0.012),
                _buildColorChips(),
                SizedBox(height: screenHeight * 0.012),
                _buildDivider(),
                SizedBox(height: screenHeight * 0.012),
                _buildSectionTitle('Size'),
                SizedBox(height: screenHeight * 0.012),
                _buildSizeChips(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Get.theme.colorScheme.onPrimary,
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

  Widget _buildDivider() {
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
        spacing: 10.0,
        runSpacing: 10.0,
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
        spacing: 10.0,
        runSpacing: 10.0,
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

  Widget _buildSizeChips() {
    return GetBuilder<FilterController>(
      id: "size",
      builder: (_) => Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
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

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              foregroundColor: Get.theme.colorScheme.secondary,
              backgroundColor: Get.theme.colorScheme.onPrimary,
            ),
            child: Text(
              'Discard',
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.secondary),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              foregroundColor: Get.theme.colorScheme.secondary,
              backgroundColor: Get.theme.colorScheme.primary,
            ),
            child: Text(
              'Apply',
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.onPrimary),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
