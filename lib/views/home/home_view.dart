import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/widgets/custom_card_category.dart';
import 'package:quick_shop/widgets/custom_card_product.dart';
import 'package:quick_shop/widgets/custom_carousel_slider.dart';
import 'package:quick_shop/widgets/dots_indicator.dart';
import 'package:quick_shop/widgets/custom_header_home.dart';
import 'package:quick_shop/widgets/custom_search_and_promo_home.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';
import 'package:quick_shop/widgets/custom_title_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.012),
                const CustomHeaderHome(),
                SizedBox(height: height * 0.012),
                const CustomSearchAndPromoHome(),
                SizedBox(height: height * 0.024),
                GetBuilder<HomeController>(
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: () {
                        CustomSnackbar.showErrorSnackbar("message");
                        log(controller.offersImages
                            .toString()); // طباعة عدد العناصر في القائمة
                        // controller.notificationController.showNotification(
                        //     'Hello', 'This is a test notification!');
                      },
                      child: const Text('Show Notification'),
                    );
                  },
                ),
                CustomTitleHome(
                  title: "Offers",
                  onTap: () => controller.goToOffers(),
                ),
                SizedBox(height: height * 0.012),
                GetBuilder<HomeController>(
                  id: "offers",
                  builder: (_) {
                    return Skeletonizer(
                      enabled: controller.isLoadingOffers,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.2,
                            child: CustomCarouselSlider(
                              items: controller.offersImages,
                              carouselController: controller.carouselController,
                              onPageChanged: controller.onPageChanged,
                            ),
                          ),
                          SizedBox(height: height * 0.024),
                          DotsIndicator(
                            itemsCount: controller.offersImages.length,
                            currentPage: controller.currentPage,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
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
