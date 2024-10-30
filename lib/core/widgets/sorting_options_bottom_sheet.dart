import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class SortingOptionsBottomSheet extends StatelessWidget {
  final String selectedOption;
  final ValueChanged<String> onSelectOption;

  const SortingOptionsBottomSheet({
    super.key,
    required this.selectedOption,
    required this.onSelectOption,
  });

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
          SizedBox(height: Get.height * 0.012),
          Center(
            child: Column(
              children: [
                Container(
                  width: context.screenWidth * 0.1,
                  height: context.screenHeight * 0.005,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                SizedBox(height: Get.height * 0.012),
                Text(
                  "Sort By",
                  style: AppTextStyles().semiBold24().copyWith(
                        color: Get.theme.colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ),
          _buildSortOption("Recommended"),
          _buildSortOption("Popular"),
          _buildSortOption("Newest"),
          _buildSortOption("Customer review"),
          _buildSortOption("Price: lowest to high"),
          _buildSortOption("Price: highest to low"),
        ],
      ),
    );
  }

  Widget _buildSortOption(String title) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles().medium14().copyWith(
              color: selectedOption == title
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.onSurface,
            ),
      ),
      onTap: () {
        onSelectOption(title);
        Get.back();
      },
    );
  }
}
