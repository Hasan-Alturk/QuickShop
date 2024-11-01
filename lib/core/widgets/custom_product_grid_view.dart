import 'package:flutter/material.dart';
import 'package:quick_shop/core/models/product.dart';
import 'package:quick_shop/core/widgets/custom_card_product.dart';

class CustomProductGridView extends StatelessWidget {
  final List<Product> products;
  final void Function(int) onTap;

  const CustomProductGridView({
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
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomCardProduct(
            image: product.images[0],
            title: product.title,
            description: product.description,
            originalPrice: product.originalPrice,
            discountedPrice: product.discountedPrice,
            onTap: () => onTap(index),
          ),
        );
      },
    );
  }
}
