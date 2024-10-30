import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/core/models/review.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/custom_rating.dart';
import 'package:quick_shop/core/widgets/show_image_dialog.dart';
import 'package:quick_shop/views/review/rating_review_controller.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';
import 'package:quick_shop/views/review/review_bottom_sheet_view.dart';

class RatingReviewView extends GetView<RatingReviewController> {
  const RatingReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Ratings & Reviews",
        style: AppTextStyles()
            .semiBold16()
            .copyWith(color: Get.theme.colorScheme.primary),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryText(),
            SizedBox(height: context.screenHeight * 0.01),
            ..._buildStarRatingIndicators(context),
            SizedBox(height: context.screenHeight * 0.01),
            _buildReviewFilterRow(context),
            SizedBox(height: context.screenHeight * 0.01),
            _buildReviewList(),
            SizedBox(height: context.screenHeight * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryText() {
    return Center(
      child: Text(
        "Summary",
        style: AppTextStyles()
            .normal16()
            .copyWith(color: Get.theme.colorScheme.secondary),
      ),
    );
  }

  List<Widget> _buildStarRatingIndicators(BuildContext context) {
    return [
      _buildStarRatingpProgress(
        context,
        title: "5  ★",
        progress: 0.85,
      ),
      SizedBox(height: context.screenHeight * 0.01),
      _buildStarRatingpProgress(
        context,
        title: "4  ★",
        progress: 0.50,
      ),
      SizedBox(height: context.screenHeight * 0.01),
      _buildStarRatingpProgress(
        context,
        title: "3  ★",
        progress: 0.35,
      ),
      SizedBox(height: context.screenHeight * 0.01),
      _buildStarRatingpProgress(
        context,
        title: "2  ★",
        progress: 0.15,
      ),
      SizedBox(height: context.screenHeight * 0.01),
      _buildStarRatingpProgress(
        context,
        title: "1  ★",
        progress: 0.10,
      )
    ];
  }

  Widget _buildStarRatingpProgress(
    BuildContext context, {
    required String title,
    required double progress,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.onSurface),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%', // عرض نسبة التقدم
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.secondary),
            ),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.01),
        LinearProgressIndicator(
          value: progress,
          backgroundColor:
              Get.theme.colorScheme.primaryContainer, // لون الخلفية
          color: Get.theme.colorScheme.primary, // لون الشريط
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildReviewFilterRow(BuildContext context) {
    return Row(
      children: [
        Text(
          "8 reviews",
          style: AppTextStyles().semiBold24().copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
        ),
        Spacer(),
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: Get.theme.colorScheme.primary,
        ),
        Text(
          "With photo",
          style: AppTextStyles().semiBold14().copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
        ),
      ],
    );
  }

  Widget _buildReviewList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.reviews.length,
        itemBuilder: (context, index) {
          return _buildReviewCard(
              context: context, review: controller.reviews[index]);
        },
      ),
    );
  }

  Widget _buildReviewCard({
    required BuildContext context,
    required Review review,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.asset(Assets.imagesArduino).image,
                  radius: 24,
                ),
                SizedBox(width: context.screenWidth * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: AppTextStyles().normal16().copyWith(
                            color: Get.theme.colorScheme.secondary,
                          ),
                    ),
                    SizedBox(height: context.screenHeight * 0.005),
                    Text(review.date,
                        style: AppTextStyles().normal12().copyWith(
                              color: Get.theme.colorScheme.onSurface,
                            )),
                  ],
                ),
                Spacer(),
                CustomRating(
                  isReadOnly: true,
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              review.reviewText,
              style: AppTextStyles()
                  .normal14()
                  .copyWith(color: Get.theme.colorScheme.secondary),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            SizedBox(
              height: context.screenHeight * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: review.imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ShowImageDialog.showImageDialog(
                          context, review.imageUrls[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        review.imageUrls[index],
                        width: context.screenWidth * 0.25,
                        height: context.screenHeight * 0.1,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  GetBuilder<RatingReviewController> _buildActionButtons(BuildContext context) {
    return GetBuilder<RatingReviewController>(
      id: "write_review",
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SizedBox(
            width: context.screenWidth,
            height: 50,
            child: CustomButton(
              onPressed: () => Get.bottomSheet(
                isScrollControlled: true,
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(screenPadding),
                    decoration: BoxDecoration(
                      color: Get.theme.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: ReviewBottomSheet(context: context),
                  ),
                ),
              ),
              text: "Write a review",
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
