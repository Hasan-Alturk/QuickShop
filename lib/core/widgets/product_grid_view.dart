import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/widgets/custom_card_product.dart';

class ProductGridView extends StatelessWidget {
  final List<CustomCardProduct> products; // final List<Product> products;
  final void Function() onTap; // تغيير هنا لتأخذ الفهرس

  const ProductGridView({
    super.key,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.53,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomCardProduct(
              image: product.image,
              productName: product.productName,
              description: product.description,
              originalPrice: product.originalPrice,
              discountedPrice: product.discountedPrice,
            ),
          ),
        );
      },
    );
  }
}
