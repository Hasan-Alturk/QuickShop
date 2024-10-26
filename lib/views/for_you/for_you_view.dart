import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_filter_button.dart';
import 'package:quick_shop/core/widgets/custom_sorting_button.dart';
import 'package:quick_shop/core/widgets/product_grid_view.dart';
import 'package:quick_shop/core/widgets/sorting_options_bottom_sheet.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            children: [
              const CustomSearch(
                icon: Icons.search,
                text: "Search clothes, laptops or etc",
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GetBuilder<ForYouController>(
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
                    child: GetBuilder<ForYouController>(
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
                    GetBuilder<ForYouController>(
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
