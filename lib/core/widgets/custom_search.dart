import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.text,

  });

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: screenPadding),
      decoration: ShapeDecoration(
        color: Get.theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Get.theme.colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesSearch,
            fit: BoxFit.contain,
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles()
                  .medium12()
                  .copyWith(color: Get.theme.colorScheme.onSecondary),
            ),
          ),
        ],
      ),
    );
  }
}