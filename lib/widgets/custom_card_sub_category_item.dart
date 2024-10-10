import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomCardSubCategoryItem extends StatelessWidget {
  const CustomCardSubCategoryItem({
    super.key,
    required this.image,
    required this.categoryName,
    required this.onTap, // إضافة حدث عند الضغط
  });

  final String image;
  final String categoryName;
  final void Function() onTap; // حدث الضغط

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // استدعاء حدث الضغط عند الضغط
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: ShapeDecoration(
              color: AppColors.nonActiveColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryName,
            style: AppTextStyles().medium10(context).copyWith(
                  color: AppColors.darkColor,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
