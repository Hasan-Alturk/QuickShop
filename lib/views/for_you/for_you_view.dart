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
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            children: [
              _buildSearch(),
              SizedBox(height: context.screenHeight * 0.015),
              _buildFilterAndSorting(context),
              SizedBox(height: context.screenHeight * 0.015),
              _buildProductList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "For You",
        style: AppTextStyles().bold16().copyWith(
              color: Get.theme.primaryColor,
            ),
      ),
    );
  }

  Widget _buildSearch() {
    return const CustomSearch(
      icon: Icons.search,
      text: "Search clothes, laptops or etc",
    );
  }

  Widget _buildFilterAndSorting(BuildContext context) {
    return Row(
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
        SizedBox(width: context.screenWidth * 0.01),
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
    );
  }

  Widget _buildProductList() {
    return Expanded(
      child: ListView(
        children: [
          GetBuilder<ForYouController>(
            id: "Products",
            builder: (_) {
              return ProductGridView(
                products: controller.products,
                onTap: (index) {
                  final selectedProduct = controller.products[index];
                  controller
                      .goToProduct(selectedProduct); // تمرير المنتج المحدد
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
