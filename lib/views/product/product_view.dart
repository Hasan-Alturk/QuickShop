import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/product/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "T-Shirt",
            style: AppTextStyles().bold16().copyWith(
                  color: Get.theme.primaryColor,
                ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/400',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                // Thumbnail Images
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://via.placeholder.com/100',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                // Product Title
                const Text(
                  'Men\'s Short-Sleeve Button-Up Shirt',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Product Price
                const Text(
                  '\$49.99',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
                const SizedBox(height: 16),
                // Size Selection
                Text(
                  'Size',
                  style: AppTextStyles()
                      .bold16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                const SizedBox(height: 8),
                GetBuilder<ProductController>(
                  id: "size",
                  builder: (_) => Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
                    children: controller.sizes.map((size) {
                      return ChoiceChip(
                        label: Text(
                          size,
                          style: TextStyle(
                            color: controller.selectedSizes.contains(size)
                                ? Get.theme.colorScheme.onPrimary
                                : Get.theme.colorScheme.secondary,
                          ),
                        ),
                        showCheckmark: false,
                        selectedColor: Get.theme.colorScheme.primary,
                        selected: controller.selectedSizes.contains(size),
                        onSelected: (bool selected) {
                          controller.updateSizes(size);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                // Color Selection
                Text(
                  'Color',
                  style: AppTextStyles()
                      .bold16()
                      .copyWith(color: Get.theme.colorScheme.secondary),
                ),
                const SizedBox(height: 8),
                GetBuilder<ProductController>(
                  id: "color",
                  builder: (_) => Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
                    children: List.generate(
                      controller.colors.length,
                      (index) {
                        return ChoiceChip(
                          label: const Text(''),
                          showCheckmark: false,
                          selectedColor: controller.colors[index],
                          selected: controller.selectedColors[index],
                          onSelected: (bool selected) {
                            controller.updateColors(index);
                          },
                          backgroundColor: controller.colors[index],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: controller.selectedColors[index]
                                  ? Get.theme.colorScheme.primary
                                  : Colors.transparent,
                              width: 3.0,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Add to Wishlist Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to add product to wishlist
                  },
                  child: const Text('Add to Wishlist'),
                ),
                const SizedBox(height: 16),
                // Product Description
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'This men\'s short-sleeve button-up shirt features a floral pattern. It is made of high-quality fabric that is comfortable and perfect for casual wear.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
