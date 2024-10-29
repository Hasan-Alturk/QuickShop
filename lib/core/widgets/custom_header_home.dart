import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/assets.dart';
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
            Icon(
              Icons.notifications,
              color: Get.theme.colorScheme.primary,
              size: 24,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.012),
        Row(
          children: [
            const Expanded(
              flex: 5,
              child: CustomSearch(
                icon: Icons.search,
                text: "Search clothes, laptops or etc",
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            const Expanded(
              flex: 2,
              child: CustomSearch(
                icon: Icons.shopping_bag_outlined,
                text: "Promo",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
