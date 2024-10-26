import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomFilterButton extends StatelessWidget {
  final void Function() onTap;

  const CustomFilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        height: 35,
        decoration: ShapeDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Get.theme.colorScheme.onSecondary),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.filter_list_outlined,
                color: Get.theme.colorScheme.primary),
            const SizedBox(width: 4),
            Text(
              "Filter",
              style: AppTextStyles().semiBold14().copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
