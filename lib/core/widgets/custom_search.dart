import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

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
          Icon(icon, color: Get.theme.colorScheme.primary),
          SizedBox(width: context.screenWidth * 0.02),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              style: AppTextStyles()
                  .medium12()
                  .copyWith(color: Get.theme.colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
