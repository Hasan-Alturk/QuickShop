import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/widgets/custom_search.dart';

class CustomSearchAndPromoHome extends StatelessWidget {
  const CustomSearchAndPromoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: CustomSearch(
            text: "Search clothes, laptops or etc",
            color: Get.theme.colorScheme.surface,
            colorText: Get.theme.colorScheme.onSecondary,
            icon: Assets.imagesSearch,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 2,
          child: CustomSearch(
            text: "Promo",
            color: Get.theme.colorScheme.surface,
            colorText: Get.theme.colorScheme.secondary,
            icon: Assets.imagesPromo,
          ),
        ),
      ],
    );
  }
}
