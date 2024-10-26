import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_filter_button.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';
import 'package:quick_shop/core/widgets/custom_sorting_button.dart';
import 'package:quick_shop/core/widgets/product_grid_view.dart';
import 'package:quick_shop/core/widgets/sorting_options_bottom_sheet.dart';
import 'package:quick_shop/views/popular/popular_controller.dart';

class PopularView extends GetView<PopularController> {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular",
          style: AppTextStyles().bold16().copyWith(
                color: Get.theme.primaryColor,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            children: [
              const CustomSearch(text: "Search clothes, laptops or etc"),
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GetBuilder<PopularController>(
                      id: "FilterOptions",
                      builder: (_) {
                        return CustomFilterButton(onTap: () {
                          controller.goToFilter();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    flex: 2,
                    child: GetBuilder<PopularController>(
                      id: "SortingOptions",
                      builder: (_) {
                        return CustomSortingButton(
                          onTap: () {
                            Get.bottomSheet(
                              SortingOptionsBottomSheet(
                                selectedOption: controller.selectedSortOption,
                                onSelectOption: (selectedTitle) {
                                  controller.changeSortingContainer(
                                    color: Get.theme.colorScheme.primary,
                                    title: selectedTitle,
                                  );
                                },
                              ),
                            );
                          },
                          selectedSortOption: controller.selectedSortOption,
                          color: controller.sortingContainerColor,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              Expanded(
                child: ListView(
                  children: [
                    GetBuilder<PopularController>(
                      id: "Products",
                      builder: (_) {
                        return ProductGridView(
                          products: controller.products,
                          onTap: () {
                            controller.goToProduct();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
