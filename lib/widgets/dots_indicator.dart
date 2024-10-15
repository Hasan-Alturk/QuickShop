import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsIndicator extends StatelessWidget {
  final int itemsCount;
  final int currentPage;

  const DotsIndicator({
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
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      }),
    );
  }
}
