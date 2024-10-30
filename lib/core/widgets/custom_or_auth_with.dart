import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

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
        SizedBox(width: context.screenWidth * 0.01),
        Text(
          text,
          style: AppTextStyles().bold12().copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
        ),
        SizedBox(width: context.screenWidth * 0.01),
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
