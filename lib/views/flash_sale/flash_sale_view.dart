import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_filter_button.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';
import 'package:quick_shop/core/widgets/custom_sorting_button.dart';
import 'package:quick_shop/core/widgets/custom_product_grid_view.dart';
import 'package:quick_shop/core/widgets/custom_sorting_bottom_sheet.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_controller.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class FlashSaleView extends GetView<FlashSaleController> {
  const FlashSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenPadding),
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
        "Flash Sale",
        style: AppTextStyles().bold16().copyWith(
              color: Get.theme.primaryColor,
            ),
      ),
    );
  }

  Widget _buildSearch() {
    return const CustomSearch(
      text: "Search clothes, laptops or etc",
      icon: Icons.search,
    );
  }

  Widget _buildFilterAndSorting(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GetBuilder<FlashSaleController>(
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
          child: GetBuilder<FlashSaleController>(
            id: "SortingOptions",
            builder: (_) {
              return CustomSortingButton(
                onTap: () {
                  Get.bottomSheet(
                    isScrollControlled: true,
                    CustomSortingBottomSheet(
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
          GetBuilder<FlashSaleController>(
            id: "Products",
            builder: (_) {
              return CustomProductGridView(
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
