import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/core/widgets/custom_card_category.dart';
import 'package:quick_shop/core/widgets/custom_card_product.dart';
import 'package:quick_shop/core/widgets/custom_carousel_slider.dart';
import 'package:quick_shop/core/widgets/dots_indicator.dart';
import 'package:quick_shop/core/widgets/custom_header_home.dart';
import 'package:quick_shop/core/widgets/custom_title_home.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.012),
                const CustomHeaderHome(),
                SizedBox(height: screenHeight * 0.024),

                // قسيمة العروض
                CustomTitleHome(
                  title: "Offers",
                  onTap: () => controller.goToOffers(),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildOffersCarousel(),

                // قائمة الفئات
                CustomTitleHome(
                  title: "Categories",
                  onTap: () => controller.goToCategories(),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildCategoriesList(),
                SizedBox(height: screenHeight * 0.012),

                // قسيمة Flash Sale
                CustomTitleHome(
                  title: "Flash Sale",
                  onTap: () => controller.goToFlashSale(),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildProductGrid(controller.products),
                SizedBox(height: screenHeight * 0.012),

                // قسيمة For You
                CustomTitleHome(
                  title: "For You",
                  onTap: () => controller.goToForYou(),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildProductGrid(controller.products),
                SizedBox(height: screenHeight * 0.012),

                // قسيمة Popular
                CustomTitleHome(
                  title: "Popular",
                  onTap: () => controller.goToPopular(),
                ),
                SizedBox(height: screenHeight * 0.012),
                _buildProductGrid(controller.products),
                SizedBox(height: screenHeight * 0.012),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOffersCarousel() {
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
            SizedBox(height: screenHeight * 0.024),
            DotsIndicator(
              itemsCount: controller.offersImages.length,
              currentPage: controller.currentPage,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      height: screenHeight * 0.1,
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

  Widget _buildProductGrid(List<CustomCardProduct> products) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.5,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            controller.goToProduct();
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomCardProduct(
              image: products[index].image,
              productName: products[index].productName,
              description: products[index].description,
              originalPrice: products[index].originalPrice,
              discountedPrice: products[index].discountedPrice,
            ),
          ),
        );
      },
    );
  }
}
