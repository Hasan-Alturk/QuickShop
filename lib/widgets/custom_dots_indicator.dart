import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int itemsCount;
  final int currentPage;

  const CustomDotsIndicator({
    super.key,
    required this.itemsCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemsCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: currentPage == index ? 20.0 : 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primaryColor
                : AppColors.secondryTextColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      }),
    );
  }
}
