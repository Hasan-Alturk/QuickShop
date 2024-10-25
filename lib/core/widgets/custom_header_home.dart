import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/widgets/custom_search.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.imagesLogoHorizontal,
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(
              Assets.imagesNotification,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: CustomSearch(
                text: "Search clothes, laptops or etc",
                color: Get.theme.scaffoldBackgroundColor,
                colorText: Get.theme.colorScheme.onSecondary,
                icon: Assets.imagesSearch,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 2,
              child: CustomSearch(
                text: "Promo",
                color: Get.theme.scaffoldBackgroundColor,
                colorText: Get.theme.colorScheme.secondary,
                icon: Assets.imagesPromo,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
