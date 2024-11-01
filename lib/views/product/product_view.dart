import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/custom_rating.dart';
import 'package:quick_shop/core/widgets/custom_dots_indicator.dart';
import 'package:quick_shop/core/widgets/custom_product_grid_view.dart';
import 'package:quick_shop/views/product/product_controller.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSlider(context),
            SizedBox(height: context.screenHeight * 0.01),
            Row(
              children: [
                _buildSizeButton(context),
                SizedBox(width: context.screenWidth * 0.05),
                _buildColorButton(context),
                SizedBox(width: context.screenWidth * 0.05),
                _buildFavoriteIcon(context),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.01),
            _buildProductDetails(context),
            SizedBox(height: context.screenHeight * 0.03),
            _buildDivider(),
            _buildInfo(context, title: "Item Details", onTap: () {}),
            _buildInfo(context, title: "Shippimg Info", onTap: () {}),
            _buildInfo(context, title: "Supports", onTap: () {}),
            SizedBox(height: context.screenHeight * 0.03),
            _buildYouCanAlsoLikeThis(context),
            SizedBox(height: context.screenHeight * 0.1),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        controller.product.title,
        style: AppTextStyles().bold16().copyWith(color: Get.theme.primaryColor),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildImageSlider(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "images",
      builder: (_) {
        return Stack(
          children: [
            SizedBox(
              height: context.screenHeight * 0.4,
              child: PageView.builder(
                onPageChanged: controller.onImageChange,
                itemCount: controller.product.images.length,
                itemBuilder: (context, index) => Image.asset(
                  controller.product.images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomDotsIndicator(
                itemsCount: controller.product.images.length,
                currentPage: controller.currentImage,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSizeButton(BuildContext context) {
    return Expanded(
      child: GetBuilder<ProductController>(
        id: "size",
        builder: (_) {
          return ElevatedButton(
            onPressed: () => Get.bottomSheet(
              isScrollControlled: true,
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenPadding),
                  decoration: BoxDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.screenHeight * 0.02),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: context.screenWidth * 0.1,
                              height: context.screenHeight * 0.005,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.onSecondary,
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            SizedBox(height: context.screenHeight * 0.012),
                            Text(
                              "Select Size",
                              style: AppTextStyles().semiBold24().copyWith(
                                    color: Get.theme.colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      GetBuilder<ProductController>(
                        id: "size",
                        builder: (_) {
                          return Wrap(
                            spacing: screenPadding,
                            runSpacing: screenPadding,
                            children: controller.sizes.map((size) {
                              return ChoiceChip(
                                showCheckmark: false,
                                label: Text(
                                  size,
                                  style: TextStyle(
                                    color: controller.selectedSize == size
                                        ? Get.theme.colorScheme.onPrimary
                                        : Get.theme.colorScheme.secondary,
                                  ),
                                ),
                                selected: controller.selectedSize == size,
                                onSelected: (bool selected) {
                                  if (selected) {
                                    controller.updateSize(size);
                                    Future.delayed(
                                      const Duration(milliseconds: 300),
                                      () {
                                        Get.back();
                                      },
                                    );
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                selectedColor: Get.theme.colorScheme.primary,
                              );
                            }).toList(),
                          );
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.05),
                    ],
                  ),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: controller.colorBorderSize,
                  width: 2,
                ),
              ),
              foregroundColor: Get.theme.colorScheme.primary,
              backgroundColor: Get.theme.colorScheme.surface,
            ),
            child: Text(
              controller.selectedSize,
              style: AppTextStyles().normal14().copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildColorButton(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "color",
      builder: (_) {
        return Expanded(
          child: ElevatedButton(
            onPressed: () => Get.bottomSheet(
              isScrollControlled: true,
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenPadding),
                  decoration: BoxDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: context.screenHeight * 0.02),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: context.screenWidth * 0.1,
                              height: context.screenHeight * 0.005,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.onSecondary,
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            SizedBox(height: context.screenHeight * 0.012),
                            Text(
                              "Select Color",
                              style: AppTextStyles().semiBold24().copyWith(
                                    color: Get.theme.colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      GetBuilder<ProductController>(
                        id: "color",
                        builder: (_) {
                          return Wrap(
                            spacing: screenPadding,
                            runSpacing: screenPadding,
                            children: controller.colors.map((color) {
                              return ChoiceChip(
                                showCheckmark: false,
                                label: Text(
                                  color,
                                  style: TextStyle(
                                    color: controller.selectedColor == color
                                        ? Get.theme.colorScheme.onPrimary
                                        : Get.theme.colorScheme.secondary,
                                  ),
                                ),
                                selected: controller.selectedColor == color,
                                onSelected: (bool selected) {
                                  if (selected) {
                                    controller.updateColor(color);
                                    Future.delayed(
                                      const Duration(milliseconds: 300),
                                      () {
                                        Get.back();
                                      },
                                    );
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                selectedColor: Get.theme.colorScheme.primary,
                              );
                            }).toList(),
                          );
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.05),
                    ],
                  ),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: controller.colorBorderColor,
                  width: 2,
                ),
              ),
              foregroundColor: Get.theme.colorScheme.primary,
              backgroundColor: Get.theme.colorScheme.surface,
            ),
            child: Text(
              controller.selectedColor,
              style: AppTextStyles().normal14().copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFavoriteIcon(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "favorite",
      builder: (_) {
        return GestureDetector(
          onTap: controller.toggleFavorite,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.colorScheme.surface,
              border: Border.all(
                  color: controller.isFavorite
                      ? Get.theme.colorScheme.primary
                      : Get.theme.colorScheme.onSecondary,
                  width: 2),
            ),
            child: Center(
              child: Icon(
                controller.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: controller.isFavorite
                    ? Get.theme.colorScheme.onError
                    : Get.theme.colorScheme.secondary,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.product.title,
                  style: AppTextStyles().semiBold24().copyWith(
                        color: Get.theme.colorScheme.secondary,
                      ),
                ),
                Text(
                  controller.product.originalPrice,
                  style: AppTextStyles().normal24().copyWith(
                        color: Get.theme.primaryColor,
                      ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.001),
            Row(
              children: [
                CustomRating(
                  isReadOnly: true,
                  itemSize: 18,
                ),
                SizedBox(width: context.screenWidth * 0.02),
                Text(
                  "(2525)",
                  style: AppTextStyles().normal12().copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.01),
            GestureDetector(
              onTap: () {
                controller.goToRatingReview();
              },
              child: Text(
                "See Reviews ...",
                style: AppTextStyles()
                    .semiBold14()
                    .copyWith(color: Get.theme.primaryColor),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Text(
              controller.product.description,
              softWrap: true,
              maxLines: 5,
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.secondary),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfo(
    BuildContext context, {
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles().semiBold16().copyWith(
                      color: Get.theme.colorScheme.secondary,
                    ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Get.theme.colorScheme.primary,
              )
            ],
          ),
          SizedBox(height: context.screenHeight * 0.01),
          _buildDivider(),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Get.theme.colorScheme.onSecondary,
    );
  }

  Widget _buildYouCanAlsoLikeThis(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like this",
          style: AppTextStyles().semiBold18().copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        CustomProductGridView(
            products: controller.products,
            onTap: (index) {
              final selectedProduct = controller.products[index];
              log("Selected Product: ${selectedProduct.title}"); // تسجيل المنتج
              controller.goToProduct(selectedProduct);
            }),
      ],
    );
  }

  GetBuilder<ProductController> _buildActionButtons(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "add_to_cart",
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SizedBox(
            width: context.screenWidth,
            height: 50,
            child: CustomButton(
              onPressed: () {},
              text: "Add To Cart",
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
