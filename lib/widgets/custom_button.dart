import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  });

  final bool isLoading;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: AppColors.lightColor,
              strokeWidth: 3,
            )
          : Text(
              text,
              style: AppTextStyles()
                  .semiBold16(context)
                  .copyWith(color: AppColors.whiteColor),
            ),
    );
  }
}
