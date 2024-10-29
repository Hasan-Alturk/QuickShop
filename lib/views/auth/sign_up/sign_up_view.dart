import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_with_email_view.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_with_phone_view.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/core/widgets/custom_container_auth.dart';
import 'package:quick_shop/core/widgets/custom_header_auth.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.27,
                child: const CustomHeaderAuth(
                  image: Assets.imagesLogoWhiteSmall,
                  title: "Sign Up to access exclusive offers",
                ),
              ),
              Expanded(
                child: Container(
                  decoration: ShapeDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenPadding),
                    child: GetBuilder<SignUpController>(builder: (_) {
                      return Column(
                        children: [
                          SizedBox(height: screenHeight * 0.024),
                          CustomContainerAuth(
                            firstText: 'Email',
                            secondText: 'Phone Number',
                            firstColor: controller.currentPage == 0
                                ? Get.theme.scaffoldBackgroundColor
                                : Get.theme.colorScheme.primaryContainer,
                            secondColor: controller.currentPage == 1
                                ? Get.theme.scaffoldBackgroundColor
                                : Get.theme.colorScheme.primaryContainer,
                            firstOnTap: () {
                              controller.jumpToPage(0);
                            },
                            secondOnTap: () {
                              controller.jumpToPage(1);
                            },
                          ),
                          Expanded(
                            child: PageView(
                              controller: controller.pageController,
                              onPageChanged: controller.onPageChanged,
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                SignUpWithEmailView(),
                                SignUpWithPhoneView(),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
