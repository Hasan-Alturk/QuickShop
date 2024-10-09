import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles()
              .semiBold16(context)
              .copyWith(color: AppColors.darkColor),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "See All",
            style: AppTextStyles()
                .semiBold16(context)
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
