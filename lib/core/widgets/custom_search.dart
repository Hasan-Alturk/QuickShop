import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.text,
    required this.color,
    required this.colorText,
    required this.icon,
  });

  final String text;
  final String icon;
  final Color color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Get.theme.colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style:
                  AppTextStyles().medium12().copyWith(color: colorText),
            ),
          ),
        ],
      ),
    );
  }
}
