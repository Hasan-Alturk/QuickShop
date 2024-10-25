import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/core/widgets/custom_bottom_auth.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/core/widgets/custom_google_facebook_iphone.dart';
import 'package:quick_shop/core/widgets/custom_or_auth_with.dart';
import 'package:quick_shop/core/widgets/custom_text_field.dart';

class SignUpWithEmailView extends GetView<SignUpController> {
  const SignUpWithEmailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.024),
          CustomTextField(
            controller: controller.emailController,
            hint: "Email",
            prefixIcon: Assets.imagesEmail,
            validator: (text) {
              RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

              if (text == null || text.isEmpty) {
                return "Email is required";
              }
              if (!regExp.hasMatch(text)) {
                return "Enter a valid email address";
              }
              return null;
            },
            onChanged: (_) {
              if (controller.isChanged) {
                controller.formKey.currentState!.validate();
              }
            },
          ),
          SizedBox(height: screenHeight * 0.024),
          GetBuilder<SignUpController>(
            id: "sign_up_button",
            builder: (_) {
              return SizedBox(
                width: screenWidth,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.goToVerificationWithEmail(
                        email: controller.emailController.text,
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
          SizedBox(height: screenHeight * 0.024),
          const CustomOrAuthWith(text: "Or Sign Up with"),
          SizedBox(height: screenHeight * 0.024),
          CustomGoogleFacebookIphone(
            onTapGoogle: () {
              controller.signInWithGoogle();
            },
            onTapFacebook: () {
              controller.signInWithFacebook();
            },
          ),
          SizedBox(height: screenHeight * 0.024),
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
