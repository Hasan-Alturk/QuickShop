import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({
    super.key,
    required this.image,
    required this.categoryName,
    required this.isSelected, // إضافة خاصية للتحقق مما إذا كان العنصر محددًا
    required this.onTap, // إضافة حدث عند الضغط
  });

  final String image;
  final String categoryName;
  final bool isSelected; // حالة التحديد
  final void Function() onTap; // حدث الضغط

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // استدعاء حدث الضغط عند الضغط
      child: Container(
        width: 65,
        height: 65,
        decoration: ShapeDecoration(
          color: isSelected
              ? Get.theme.colorScheme.primary
              : Get.theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 8),
            Text(
              categoryName,
              style: AppTextStyles().medium10(context).copyWith(
                    color: isSelected
                        ? Get.theme.colorScheme.onPrimary
                        : Get.theme.colorScheme.secondary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
