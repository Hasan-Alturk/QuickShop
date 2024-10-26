import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/dots_indicator.dart';
import 'package:quick_shop/core/widgets/sorting_options_bottom_sheet.dart';
import 'package:quick_shop/views/product/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product",
          style: AppTextStyles().bold16().copyWith(
                color: Get.theme.primaryColor,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProductController>(
                id: "images",
                builder: (_) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.4,
                        child: PageView.builder(
                          onPageChanged: (index) =>
                              controller.onImageChange(index),
                          itemCount: controller.images.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              controller.images[index],
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: screenHeight * 0.38),
                          DotsIndicator(
                            itemsCount: controller.images.length,
                            currentPage: controller.currentImage,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<ProductController>(
                      id: "size",
                      builder: (_) {
                        return ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenPadding),
                                decoration: BoxDecoration(
                                  color: Get.theme.scaffoldBackgroundColor,
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(32),
                                  ),
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
                                              color: Get.theme.colorScheme
                                                  .onSecondary,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight * 0.012),
                                          Text(
                                            "Select Size",
                                            style: AppTextStyles()
                                                .semiBold24()
                                                .copyWith(
                                                    color: Get.theme.colorScheme
                                                        .secondary),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.012),
                                    GetBuilder<ProductController>(
                                      id: "size",
                                      builder: (_) {
                                        return Column(
                                          children: [
                                            Wrap(
                                              spacing: 12.0,
                                              runSpacing: 6.0,
                                              children: controller.sizes.map(
                                                (size) {
                                                  return ChoiceChip(
                                                    label: Text(
                                                      size,
                                                      style: TextStyle(
                                                        color: controller
                                                                    .selectedSize ==
                                                                size
                                                            ? Get
                                                                .theme
                                                                .colorScheme
                                                                .onPrimary
                                                            : Get
                                                                .theme
                                                                .colorScheme
                                                                .secondary,
                                                      ),
                                                    ),
                                                    showCheckmark: false,
                                                    selectedColor: Get.theme
                                                        .colorScheme.primary,
                                                    selected: controller
                                                            .selectedSize ==
                                                        size,
                                                    onSelected:
                                                        (bool selected) {
                                                      if (selected) {
                                                        controller
                                                            .updateSize(size);
                                                      }
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                            SizedBox(
                                                height: screenHeight * 0.05),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: controller.colorBorderSize,
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
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: Get.theme.colorScheme.onSecondary,
                          ),
                        ),
                        foregroundColor: Get.theme.colorScheme.primary,
                        backgroundColor: Get.theme.colorScheme.surface,
                      ),
                      child: Text(
                        'Color',
                        style: AppTextStyles()
                            .normal14()
                            .copyWith(color: Get.theme.colorScheme.secondary),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.theme.colorScheme.surface,
                        border: Border.all(
                          color: Get.theme.colorScheme.onSecondary,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Get.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Text("H&M",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("Short-Sleeve T-Shirt",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const Text("\$19.99",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              const SizedBox(height: 16),

              // Colors and Sizes
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Color: Black", style: TextStyle(fontSize: 14)),
                  Text("Size: M", style: TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 16),

              // Expandable Sections
              const ExpansionTile(
                title: Text("Item Details"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Soft cotton jersey with decorative buttons down the front."),
                  )
                ],
              ),
              const ExpansionTile(
                title: Text("Shipping Info"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Free shipping on orders over \$50."),
                  )
                ],
              ),
              const ExpansionTile(
                title: Text("Supports"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Contact us at support@hm.com."),
                  )
                ],
              ),

              // Suggested Products Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text("You can also like this",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image.network(
                            //   'https://via.placeholder.com/150x200', // Replace with real image
                            //   height: 150,
                            //   fit: BoxFit.cover,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Product Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  const Text("30\$"),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return const Icon(Icons.star,
                                          color: Colors.yellow, size: 16);
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child:
                      const Text("Add To Cart", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
