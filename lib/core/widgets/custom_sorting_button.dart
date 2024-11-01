import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

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
        padding: EdgeInsets.fromLTRB(
          screenPadding / 2,
          screenPadding / 4,
          screenPadding / 2,
          screenPadding / 4,
        ),
        height: 40,
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
            SizedBox(width: context.screenWidth * 0.01),
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
