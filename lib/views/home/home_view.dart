import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/models/product.dart';
import 'package:quick_shop/core/widgets/product_grid_view.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/core/widgets/custom_card_category.dart';
import 'package:quick_shop/core/widgets/custom_carousel_slider.dart';
import 'package:quick_shop/core/widgets/dots_indicator.dart';
import 'package:quick_shop/core/widgets/custom_header_home.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.02),
              const CustomHeaderHome(),
              SizedBox(height: context.screenHeight * 0.05),
              Expanded(
                child: ListView(
                  children: [
                    _buildSectionTitle("Offers", controller.goToOffers),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildOffersCarousel(context),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildSectionTitle("Categories", controller.goToCategories),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildCategoriesList(context),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildSectionTitle("Flash Sale", controller.goToFlashSale),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildProductGrid(controller.products),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildSectionTitle("For You", controller.goToForYou),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildProductGrid(controller.products),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildSectionTitle("Popular", controller.goToPopular),
                    SizedBox(height: context.screenHeight * 0.01),
                    _buildProductGrid(controller.products),
                    SizedBox(height: context.screenHeight * 0.01),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles()
              .semiBold16()
              .copyWith(color: Get.theme.colorScheme.secondary),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "See All",
            style: AppTextStyles()
                .semiBold16()
                .copyWith(color: Get.theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildOffersCarousel(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "offers",
      builder: (_) {
        return Column(
          children: [
            CustomCarouselSlider(
              items: controller.offersImages,
              carouselController: controller.carouselController,
              onPageChanged: controller.onPageChanged,
            ),
            SizedBox(height: context.screenHeight * 0.024),
            DotsIndicator(
              itemsCount: controller.offersImages.length,
              currentPage: controller.currentPage,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.09,
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomCardCategory(
              image: controller.categories[index],
              categoryName: controller.categoriesNames[index],
              isSelected: false,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return GetBuilder<HomeController>(builder: (_) {
      return ProductGridView(
        products: controller.products,
        onTap: (index) {
          final selectedProduct = controller.products[index];
          controller.goToProduct(selectedProduct); // تمرير المنتج المحدد
        },
      );
    });
  }
}
