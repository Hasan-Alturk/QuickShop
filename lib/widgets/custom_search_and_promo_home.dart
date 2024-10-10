import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/widgets/custom_search.dart';

class CustomSearchAndPromoHome extends StatelessWidget {
  const CustomSearchAndPromoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 5,
          child: CustomSearch(
            text: "Search clothes, laptops or etc",
            color: AppColors.nonActiveColor,
            colorText: AppColors.grayColor,
            icon: Assets.imagesSearch,
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          flex: 2,
          child: CustomSearch(
            text: "Promo",
            color: AppColors.nonActiveColor,
            colorText: AppColors.darkColor,
            icon: Assets.imagesPromo,
          ),
        ),
      ],
    );
  }
}
