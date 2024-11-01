import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class BottomAuth extends StatelessWidget {
  const BottomAuth({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles()
              .bold16()
              .copyWith(color: Get.theme.colorScheme.onSurface),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: AppTextStyles()
                .bold16()
                .copyWith(color: Get.theme.colorScheme.primary),
          ),
        )
      ],
    );
  }
}
