import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/onBoarding/on_boarding_controller.dart';
import 'package:quick_shop/core/widgets/dots_indicator.dart';
import 'package:quick_shop/core/widgets/custom_page_view_on_boarding_item.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSkipButton(),
            Expanded(
              child: _buildPageView(),
            ),
            _buildBottomIndicator(),
            SizedBox(height: context.screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GetBuilder<OnBoardingController>(
          builder: (_) {
            return Visibility(
              visible: controller.currentPage != controller.items.length - 1,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: InkWell(
                onTap: controller.goToHome,
                child: Padding(
                  padding: EdgeInsets.all(screenPadding),
                  child: Text(
                    'skip',
                    style: AppTextStyles().semiBold16().copyWith(
                          color: Get.theme.colorScheme.secondary,
                        ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return CustomPageViewOnBoardingItem(
          image: controller.items[index].image,
          title: controller.items[index].title,
          subtitle: controller.items[index].subTitle,
        );
      },
    );
  }

  Widget _buildBottomIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPadding),
      child: GetBuilder<OnBoardingController>(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(
                itemsCount: controller.items.length,
                currentPage: controller.currentPage,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: (controller.currentPage + 1) /
                          controller.items.length,
                      strokeWidth: 2,
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        controller.currentPage == controller.items.length - 1
                            ? Get.theme.primaryColor
                            : Get.theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.jumpToPage,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Get.theme.colorScheme.primary,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
