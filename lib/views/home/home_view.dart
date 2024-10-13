import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/widgets/custom_card_category.dart';
import 'package:quick_shop/widgets/custom_card_product.dart';
import 'package:quick_shop/widgets/custom_carousel_slider.dart';
import 'package:quick_shop/widgets/dots_indicator.dart';
import 'package:quick_shop/widgets/custom_header_home.dart';
import 'package:quick_shop/widgets/custom_search_and_promo_home.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';
import 'package:quick_shop/widgets/custom_title_home.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const CustomHeaderHome(),
                const SizedBox(height: 12),
                const CustomSearchAndPromoHome(),
                const SizedBox(height: 24),
                GetBuilder<HomeController>(builder: (_) {
                  return ElevatedButton(
                    onPressed: () {
                      CustomSnackbar.showErrorSnackbar("message");
                      // controller.notificationController.showNotification(
                      //     'Hello', 'This is a test notification!');
                    },
                    child: const Text('Show Notification'),
                  );
                }),
                CustomTitleHome(
                  title: "Offers",
                  onTap: () => controller.goToOffers(),
                ),
                GetBuilder<HomeController>(
                  builder: (_) {
                    return Column(
                      children: [
                        CustomCarouselSlider(
                          items: controller.items,
                          carouselController: controller.carouselController,
                          onPageChanged: controller.onPageChanged,
                        ),
                        DotsIndicator(
                          itemsCount: controller.items.length,
                          currentPage: controller.currentPage,
                        ),
                      ],
                    );
                  },
                ),
                CustomTitleHome(
                  title: "Categories",
                  onTap: () => controller.goToCategories(),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 75,
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
                          onTap: () {
                            controller.selectCategory(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                CustomTitleHome(
                  title: "Flash Sale",
                  onTap: () => controller.goToFlashSale(),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomCardProduct(
                          image: controller.products[index].image,
                          productName: controller.products[index].productName,
                          description: controller.products[index].description,
                          originalPrice:
                              controller.products[index].originalPrice,
                          discountedPrice:
                              controller.products[index].discountedPrice,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                CustomTitleHome(
                  title: "For You",
                  onTap: () => controller.goToForYou(),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomCardProduct(
                          image: controller.products[index].image,
                          productName: controller.products[index].productName,
                          description: controller.products[index].description,
                          originalPrice:
                              controller.products[index].originalPrice,
                          discountedPrice:
                              controller.products[index].discountedPrice,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                CustomTitleHome(
                  title: "Popular",
                  onTap: () => controller.goToPopular(),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomCardProduct(
                          image: controller.products[index].image,
                          productName: controller.products[index].productName,
                          description: controller.products[index].description,
                          originalPrice:
                              controller.products[index].originalPrice,
                          discountedPrice:
                              controller.products[index].discountedPrice,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
