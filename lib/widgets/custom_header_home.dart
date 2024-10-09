import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
