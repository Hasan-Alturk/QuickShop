import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class CustomFilterButton extends StatelessWidget {
  final void Function() onTap;

  const CustomFilterButton({super.key, required this.onTap});

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
            side: BorderSide(color: Get.theme.colorScheme.onSecondary),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.filter_list_outlined,
                color: Get.theme.colorScheme.primary),
            SizedBox(width: context.screenWidth * 0.01),
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
