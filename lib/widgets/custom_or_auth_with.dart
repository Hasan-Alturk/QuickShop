import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        const SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles().bold12(context).copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
        ),
        const SizedBox(width: 10),
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
