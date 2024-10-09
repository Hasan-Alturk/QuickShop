import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomBottomAuth extends StatelessWidget {
  const CustomBottomAuth({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles()
              .bold16(context)
              .copyWith(color: AppColors.secondryTextColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: AppTextStyles()
                .bold16(context)
                .copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
