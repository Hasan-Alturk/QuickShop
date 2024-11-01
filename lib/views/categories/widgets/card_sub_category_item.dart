import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class CardSubCategoryItem extends StatelessWidget {
  const CardSubCategoryItem({
    super.key,
    required this.image,
    required this.categoryName,
    required this.onTap,
  });

  final String image;
  final String categoryName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: ShapeDecoration(
              color: Get.theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.01),
          Text(
            categoryName,
            style: AppTextStyles().medium10().copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
