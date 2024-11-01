import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/views/auth/login/login_controller.dart';
import 'package:quick_shop/views/auth/login/login_with_email_view.dart';
import 'package:quick_shop/views/auth/login/login_with_phone_view.dart';
import 'package:quick_shop/views/auth/widgets/container_auth.dart';
import 'package:quick_shop/views/auth/widgets/header_auth.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              _buildHeaderAuth(context),
              Expanded(
                child: _buildBody(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderAuth(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.27,
      child: const HeaderAuth(
        title: "Unlock your shopping adventure",
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
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
        child: GetBuilder<LoginController>(
          builder: (_) => Column(
            children: [
              SizedBox(height: context.screenHeight * 0.024),
              _buildAuthOptions(),
              _buildPageView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthOptions() {
    return ContainerAuth(
      firstText: 'Email',
      secondText: 'Phone Number',
      firstColor: controller.currentPage == 0
          ? Get.theme.scaffoldBackgroundColor
          : Get.theme.colorScheme.primaryContainer,
      secondColor: controller.currentPage == 1
          ? Get.theme.scaffoldBackgroundColor
          : Get.theme.colorScheme.primaryContainer,
      firstOnTap: () => controller.jumpToPage(0),
      secondOnTap: () => controller.jumpToPage(1),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          LoginWithEmailView(),
          LoginWithPhoneView(),
        ],
      ),
    );
  }
}
