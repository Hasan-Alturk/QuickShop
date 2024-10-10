import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomContainerAuth<T extends GetxController> extends StatelessWidget {
  const CustomContainerAuth({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.firstOnTap,
    required this.secondOnTap,
    required this.firstColor,
    required this.secondColor,
  });

  final String firstText;
  final String secondText;

  final Color firstColor;
  final Color secondColor;

  final void Function() firstOnTap;
  final void Function() secondOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: firstOnTap,
                child: Container(
                  height: 44,
                  decoration: ShapeDecoration(
                    color: firstColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.nonActiveColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      firstText,
                      style: AppTextStyles()
                          .semiBold16(context)
                          .copyWith(color: AppColors.darkColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: secondOnTap,
                child: Container(
                  height: 44,
                  decoration: ShapeDecoration(
                    color: secondColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.nonActiveColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      secondText,
                      style: AppTextStyles()
                          .semiBold16(context)
                          .copyWith(color: AppColors.darkColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
