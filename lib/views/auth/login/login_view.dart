import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/auth/login/login_controller.dart';
import 'package:quick_shop/views/auth/login/login_with_email_view.dart';
import 'package:quick_shop/views/auth/login/login_with_phone_view.dart';
import 'package:quick_shop/widgets/custom_container_auth.dart';
import 'package:quick_shop/widgets/custom_header_auth.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.27,
                child: const CustomHeaderAuth(
                  image: Assets.imagesLogoWhiteSmall,
                  title: "Unlock your shopping adventure",
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                    color: AppColors.lightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GetBuilder<LoginController>(
                      builder: (_) {
                        return Column(
                          children: [
                            const SizedBox(height: 24),
                            CustomContainerAuth(
                              firstText: 'Email',
                              secondText: 'Phone Number',
                              firstColor: controller.currentPage == 0
                                  ? AppColors.lightColor
                                  : AppColors.containerColor,
                              secondColor: controller.currentPage == 1
                                  ? AppColors.lightColor
                                  : AppColors.containerColor,
                              firstOnTap: () {
                                controller.animateToPage(0);
                              },
                              secondOnTap: () {
                                controller.animateToPage(1);
                              },
                            ),
                            Expanded(
                              child: PageView(
                                controller: controller.pageController,
                                onPageChanged: controller.onPageChanged,
                                children: const [
                                  LoginWithEmailView(),
                                  LoginWithPhoneView(),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
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
