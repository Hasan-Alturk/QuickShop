import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/views/auth/widgets/bottom_auth.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/views/auth/widgets/google_facebook_iphone.dart';
import 'package:quick_shop/views/auth/widgets/custom_initl_phone_number.dart';
import 'package:quick_shop/views/auth/widgets/or_auth_with.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class SignUpWithPhoneView extends GetView<SignUpController> {
  const SignUpWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.024),
          _buildPhoneNumberField(),
          SizedBox(height: context.screenHeight * 0.024),
          _buildSignUpButton(context),
          SizedBox(height: context.screenHeight * 0.024),
          const OrAuthWith(text: "Or Sign Up with"),
          SizedBox(height: context.screenHeight * 0.024),
          _buildSocialMediaButtons(),
          SizedBox(height: context.screenHeight * 0.024),
          _buildBottomLoginLink(),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return CustomIntlPhoneNumber(
      controller: controller.phoneController,
      formKey: controller.formKey,
      isChanged: controller.isChanged,
      onFullNumber: (String fullNumber) {
        controller.fullNumber = fullNumber;
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return GetBuilder<SignUpController>(
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
    );
  }

  Widget _buildSocialMediaButtons() {
    return GoogleFacebookIphone(
      onTapGoogle: () {
        controller.signInWithGoogle();
      },
      onTapFacebook: () {
        controller.signInWithFacebook();
      },
    );
  }

  Widget _buildBottomLoginLink() {
    return BottomAuth(
      title: 'Already have an account ?',
      subTitle: '  Login',
      onTap: () {
        controller.goToLogin();
      },
    );
  }
}
