import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';
import 'package:quick_shop/widgets/custom_search.dart';

class ForYouView extends GetView<ForYouController> {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "For You",
          style: AppTextStyles().bold16(context).copyWith(
                color: Get.theme.primaryColor,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomSearch(
                text: "Search clothes, laptops or etc",
                color: Get.theme.scaffoldBackgroundColor,
                colorText: Get.theme.colorScheme.onSecondary,
                icon: Assets.imagesSearch,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Get.theme.scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Get.theme.colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.filter_list_outlined,
                                color: Get.theme.colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Filter",
                              style: AppTextStyles()
                                  .semiBold14(context)
                                  .copyWith(
                                      color: Get.theme.colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => _showSortingOptions(context),
                      child: Container(
                        height: 35,
                        decoration: ShapeDecoration(
                          color: Get.theme.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Get.theme.colorScheme.primaryContainer,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.swap_vert_sharp,
                                  color: Get.theme.colorScheme.primary),
                              const SizedBox(width: 8),
                              Obx(
                                () => Text(
                                  controller.selectedSortOption.value,
                                  style: AppTextStyles()
                                      .semiBold14(context)
                                      .copyWith(
                                          color:
                                              Get.theme.colorScheme.onSurface),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSortingOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Sort By",
                style: AppTextStyles().semiBold24(context).copyWith(
                      color: Get.theme.colorScheme.secondary,
                    ),
              ),
            ),
            _buildSortOption(
              context,
              "Popular",
              controller.selectedSortOption.value == "Popular",
            ),
            const Divider(thickness: 0.3),
            _buildSortOption(
              context,
              "Newest",
              controller.selectedSortOption.value == "Newest",
            ),
            const Divider(thickness: 0.3),
            _buildSortOption(
              context,
              "Customer review",
              controller.selectedSortOption.value == "Customer review",
            ),
            const Divider(thickness: 0.3),
            _buildSortOption(
              context,
              "Price: lowest to high",
              controller.selectedSortOption.value == "Price: lowest to high",
            ),
            const Divider(thickness: 0.3),
            _buildSortOption(
              context,
              "Price: highest to low",
              controller.selectedSortOption.value == "Price: highest to low",
            ),
          ],
        );
      },
    );
  }

  Widget _buildSortOption(BuildContext context, String title, bool isSelected) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles().medium14(context).copyWith(
              color: isSelected
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.onSurface,
            ),
      ),
      onTap: () {
        controller.selectedSortOption.value = title;
        Navigator.pop(context);
      },
    );
  }
}
