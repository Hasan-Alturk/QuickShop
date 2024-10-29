import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/core/widgets/custom_bottom_auth.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/custom_google_facebook_iphone.dart';
import 'package:quick_shop/core/widgets/custom_initl_phone_number.dart';
import 'package:quick_shop/core/widgets/custom_or_auth_with.dart';

class SignUpWithPhoneView extends GetView<SignUpController> {
  const SignUpWithPhoneView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.024),
          CustomIntlPhoneNumber(
            controller: controller.phoneController,
            formKey: controller.formKey,
            isChanged: controller.isChanged,
            onFullNumber: (String fullNumber) {
              controller.fullNumber = fullNumber;
            },
          ),
          SizedBox(height: context.screenHeight * 0.024),
          GetBuilder<SignUpController>(
            id: "sign_up_button",
            builder: (_) {
              return SizedBox(
                width: context.screenWidth,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.goToVerificationCodeWithPhone(
                        fullNumber: controller.fullNumber,
                      );
                    } else {
                      log("Error From validate");
                    }
                  },
                  text: "Sign Up",
                  isLoading: controller.isLoading,
                ),
              );
            },
          ),
          SizedBox(height: context.screenHeight * 0.024),
          const CustomOrAuthWith(text: "Or Sign Up with"),
          SizedBox(height: context.screenHeight * 0.024),
          CustomGoogleFacebookIphone(
            onTapGoogle: () {
              controller.signInWithGoogle();
            },
            onTapFacebook: () {
              controller.signInWithFacebook();
            },
          ),
          SizedBox(height: context.screenHeight * 0.024),
          CustomBottomAuth(
            title: 'Already have an account ?',
            subTitle: '  Login',
            onTap: () {
              controller.goToLogin();
            },
          ),
        ],
      ),
    );
  }
}
