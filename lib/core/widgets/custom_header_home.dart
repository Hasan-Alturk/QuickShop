import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
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
        SizedBox(height: screenHeight * 0.012),
        Row(
          children: [
            const Expanded(
              flex: 5,
              child: CustomSearch(
                text: "Search clothes, laptops or etc",
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            const Expanded(
              flex: 2,
              child: CustomSearch(
                text: "Promo",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
