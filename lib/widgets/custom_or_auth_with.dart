import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomOrAuthWith extends StatelessWidget {
  const CustomOrAuthWith({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.grayColor,
            thickness: 2,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles().bold12(context).copyWith(
                color: AppColors.secondryTextColor,
              ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(
            color: AppColors.grayColor,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
