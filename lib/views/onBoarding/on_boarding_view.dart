import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/onBoarding/on_boarding_controller.dart';
import 'package:quick_shop/widgets/dots_indicator.dart';
import 'package:quick_shop/widgets/custom_page_view_on_boarding_item.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetBuilder<OnBoardingController>(
                  builder: (_) {
                    return Visibility(
                      visible:
                          controller.currentPage != controller.items.length - 1,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: InkWell(
                        onTap: () {
                          controller.goToLogin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'skip',
                            style: AppTextStyles().semiBold16(context).copyWith(
                                  color: Get.theme.colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                  controller.items.length, // تقدم الدائرة
                              strokeWidth: 2, // سمك الدائرة
                              backgroundColor:
                                  Colors.transparent, // خلفية شفافة
                              valueColor: AlwaysStoppedAnimation<Color>(
                                controller.currentPage ==
                                        controller.items.length - 1
                                    ? Get.theme.primaryColor
                                    : Get.theme.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.goToNextPage();
                            },
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
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
