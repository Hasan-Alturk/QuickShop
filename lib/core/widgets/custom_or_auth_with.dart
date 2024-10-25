import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomOrAuthWith extends StatelessWidget {
  const CustomOrAuthWith({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Get.theme.colorScheme.onSecondary,
            thickness: 2,
          ),
        ),
        SizedBox(width: screenWidth * 0.01),
        Text(
          text,
          style: AppTextStyles().bold12().copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
        ),
        SizedBox(width: screenWidth * 0.01),
        Expanded(
          child: Divider(
            color: Get.theme.colorScheme.onSecondary,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
