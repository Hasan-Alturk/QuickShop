import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';

class SortOptionsBottomSheet extends StatelessWidget {
  final ForYouController controller;

  const SortOptionsBottomSheet({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Sort By",
                  style: AppTextStyles().semiBold24().copyWith(
                        color: Get.theme.colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ),
          _buildSortOption(
              "Recoomended", controller.selectedSortOption == "Recoomended"),
          const Divider(thickness: 0.3),
          _buildSortOption(
              "Popular", controller.selectedSortOption == "Popular"),
          const Divider(thickness: 0.3),
          _buildSortOption("Newest", controller.selectedSortOption == "Newest"),
          const Divider(thickness: 0.3),
          _buildSortOption("Customer review",
              controller.selectedSortOption == "Customer review"),
          const Divider(thickness: 0.3),
          _buildSortOption("Price: lowest to high",
              controller.selectedSortOption == "Price: lowest to high"),
          const Divider(thickness: 0.3),
          _buildSortOption("Price: highest to low",
              controller.selectedSortOption == "Price: highest to low"),
        ],
      ),
    );
  }

  Widget _buildSortOption(String title, bool isSelected) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles().medium14().copyWith(
              color: isSelected
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.onSurface,
            ),
      ),
      onTap: () {
        controller.changeSortingContainer(
          color: Get.theme.colorScheme.primary,
          title: title,
        );
        Get.back();
      },
    );
  }
}
