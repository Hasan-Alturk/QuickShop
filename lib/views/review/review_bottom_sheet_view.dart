import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/custom_rating.dart';
import 'package:quick_shop/views/review/rating_review_controller.dart';

class ReviewBottomSheet extends GetView<RatingReviewController> {
  const ReviewBottomSheet({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth * 0.1,
          height: context.screenHeight * 0.005,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Text(
          "What’s your rate ?",
          style: AppTextStyles()
              .semiBold24()
              .copyWith(color: Get.theme.colorScheme.secondary),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        CustomRating(isReadOnly: false),
        SizedBox(height: context.screenHeight * 0.02),
        Text(
          "Please share your opinion about the product",
          style: AppTextStyles()
              .medium14()
              .copyWith(color: Get.theme.colorScheme.secondary),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.all(screenPadding),
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Your review...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(screenPadding),
              ),
              style: AppTextStyles().semiBold18().copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
            ),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        GetBuilder<RatingReviewController>(
          id: "pick_images",
          builder: (_) {
            return GestureDetector(
              onTap: () {
                controller.pickImages();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.images.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(screenPadding),
                      child: SizedBox(
                        height: 125,
                        width: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                File(controller.images[index].path),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 36,
                            backgroundColor: Get.theme.colorScheme.primary,
                            child: Icon(
                              Icons.camera_alt,
                              color: Get.theme.colorScheme.onPrimary,
                              size: 30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Add your photos',
                            style: AppTextStyles().medium12().copyWith(
                                  color: Get.theme.colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: context.screenHeight * 0.02),
        SizedBox(
          height: 50,
          width: context.screenWidth,
          child: CustomButton(
            onPressed: () {},
            text: "Send Review",
            isLoading: false,
          ),
        ),
      ],
    );
  }
}
