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
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.onPrimary,
        title: Text(
          "Filter",
          style: AppTextStyles().bold16().copyWith(
                color: Get.theme.primaryColor,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.012),
                Text(
                  'Category',
                  style: AppTextStyles()
                      .normal16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                SizedBox(height: screenHeight * 0.012),
                GetBuilder<FilterController>(
                  id: "category",
                  builder: (controller) => Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
                    children: controller.categories.map(
                      (category) {
                        return ChoiceChip(
                          label: Text(
                            category,
                            style: TextStyle(
                              color: controller.selectedCategories
                                      .contains(category)
                                  ? Get.theme.colorScheme.onPrimary
                                  : Get.theme.colorScheme.secondary,
                            ),
                          ),
                          showCheckmark: false,
                          selectedColor: Get.theme.colorScheme.primary,
                          selected:
                              controller.selectedCategories.contains(category),
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
                ),
                SizedBox(height: screenHeight * 0.012),
                Divider(color: Get.theme.colorScheme.onSecondary),
                SizedBox(height: screenHeight * 0.012),
                Text(
                  'Price',
                  style: AppTextStyles()
                      .normal16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                SizedBox(height: screenHeight * 0.012),
                GetBuilder<FilterController>(
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
                ),
                SizedBox(height: screenHeight * 0.012),
                Divider(color: Get.theme.colorScheme.onSecondary),
                SizedBox(height: screenHeight * 0.012),
                Text(
                  'Color',
                  style: AppTextStyles()
                      .normal16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                SizedBox(height: screenHeight * 0.012),
                GetBuilder<FilterController>(
                  id: "color",
                  builder: (_) => Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
                    children: List.generate(
                      controller.colors.length,
                      (index) {
                        return ChoiceChip(
                          label: const Text(''),
                          showCheckmark: false,
                          selectedColor: controller.colors[index],
                          selected: controller.selectedColors[index],
                          onSelected: (bool selected) {
                            controller.updateColors(index);
                          },
                          backgroundColor: controller.colors[index],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: controller.selectedColors[index]
                                  ? Get.theme.colorScheme.primary
                                  : Colors.transparent,
                              width: 3.0,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.012),
                Divider(color: Get.theme.colorScheme.onSecondary),
                SizedBox(height: screenHeight * 0.012),
                Text(
                  'Size',
                  style: AppTextStyles()
                      .normal16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                SizedBox(height: screenHeight * 0.012),
                GetBuilder<FilterController>(
                  id: "size",
                  builder: (_) => Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
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
                    )),
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
      ),
    );
  }
}
