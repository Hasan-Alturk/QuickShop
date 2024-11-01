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
        _buildIndicator(context),
        SizedBox(height: context.screenHeight * 0.02),
        _buildTitle(),
        SizedBox(height: context.screenHeight * 0.02),
        _buildRating(),
        SizedBox(height: context.screenHeight * 0.02),
        _buildDescription(),
        SizedBox(height: context.screenHeight * 0.02),
        _buildReviewInput(),
        SizedBox(height: context.screenHeight * 0.02),
        _buildImagePicker(context),
        SizedBox(height: context.screenHeight * 0.02),
        _buildSendButton(context),
      ],
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.1,
      height: context.screenHeight * 0.005,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "What’s your rate?",
      style: AppTextStyles().semiBold24().copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
    );
  }

  Widget _buildRating() {
    return CustomRating(
      isReadOnly: false,
      itemSize: 36,
    );
  }

  Widget _buildDescription() {
    return Text(
      "Please share your opinion about the product",
      style: AppTextStyles().medium14().copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
    );
  }

  Widget _buildReviewInput() {
    return Padding(
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
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return GetBuilder<RatingReviewController>(
      id: "pick_images",
      builder: (_) {
        return GestureDetector(
          onTap: controller.pickImages,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.images.isNotEmpty) _buildImagePreview(),
              _buildAddPhotoButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePreview() {
    return Padding(
      padding: const EdgeInsets.all(screenPadding),
      child: SizedBox(
        height: 150,
        width: 125,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(screenPadding / 2),
              child: Image.file(
                File(controller.images[index].path),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddPhotoButton(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(screenPadding),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: context.screenHeight * 0.01),
          Text(
            'Add your photos',
            style: AppTextStyles().medium12().copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.screenWidth,
      child: CustomButton(
        onPressed: () {
          // Logic to send the review
        },
        text: "Send Review",
        isLoading: false,
      ),
    );
  }
}
