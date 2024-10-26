// custom_sorting_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomSortingButton extends StatelessWidget {
  final void Function() onTap;
  final String selectedSortOption;
  final Color color;

  const CustomSortingButton({
    super.key,
    required this.onTap,
    required this.selectedSortOption,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        height: 35,
        decoration: ShapeDecoration(
          color: Get.theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.swap_vert_sharp, color: Get.theme.colorScheme.primary),
            const SizedBox(width: 4),
            Text(
              selectedSortOption,
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
