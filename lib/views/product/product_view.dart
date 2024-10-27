import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/dots_indicator.dart';
import 'package:quick_shop/views/product/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSlider(),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                _buildSizeButton(),
                SizedBox(width: screenWidth * 0.05),
                _buildColorButton(),
                SizedBox(width: screenWidth * 0.05),
                _buildFavoriteIcon(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Product",
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

  Widget _buildImageSlider() {
    return GetBuilder<ProductController>(
      id: "images",
      builder: (_) {
        return Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
              child: PageView.builder(
                onPageChanged: controller.onImageChange,
                itemCount: controller.images.length,
                itemBuilder: (context, index) => Image.asset(
                  controller.images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: DotsIndicator(
                itemsCount: controller.images.length,
                currentPage: controller.currentImage,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSizeButton() {
    return Expanded(
      child: GetBuilder<ProductController>(
        id: "size",
        builder: (_) {
          return ElevatedButton(
            onPressed: () => Get.bottomSheet(
              Container(
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
                    SizedBox(height: screenHeight * 0.012),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.005,
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.012),
                          Text(
                            "Select Size",
                            style: AppTextStyles().semiBold24().copyWith(
                                  color: Get.theme.colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),
                    GetBuilder<ProductController>(
                      id: "size",
                      builder: (_) {
                        return Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
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
                    SizedBox(height: screenHeight * 0.1),
                  ],
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: controller.colorBorderSize),
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

  Widget _buildColorButton() {
    return GetBuilder<ProductController>(
      id: "color",
      builder: (_) {
        return Expanded(
          child: ElevatedButton(
            onPressed: () => Get.bottomSheet(
              isScrollControlled: true,
              Container(
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
                    SizedBox(height: screenHeight * 0.012),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.005,
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.012),
                          Text(
                            "Select Color",
                            style: AppTextStyles().semiBold24().copyWith(
                                  color: Get.theme.colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),
                    GetBuilder<ProductController>(
                      id: "color",
                      builder: (_) {
                        return Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
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
                    SizedBox(height: screenHeight * 0.1),
                  ],
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: controller.colorBorderColor),
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

  Widget _buildFavoriteIcon() {
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
              border: Border.all(color: Get.theme.colorScheme.onSecondary),
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

  GetBuilder<ProductController> _buildActionButtons() {
    return GetBuilder<ProductController>(
      id: "add_to_cart",
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SizedBox(
            width: screenWidth,
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
