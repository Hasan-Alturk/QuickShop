import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/widgets/custom_bottom_auth.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_google_facebook_iphone.dart';
import 'package:quick_shop/widgets/custom_or_auth_with.dart';
import 'package:quick_shop/widgets/custom_text_field.dart';

class SignUpWithEmailView extends GetView<SignUpController> {
  const SignUpWithEmailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          GetBuilder<SignUpController>(builder: (_) {
            return CustomTextField(
              controller: controller.emailController,
              hint: "Email",
              prefixIcon: Assets.imagesEmail,
              validator: (text) {
                RegExp regExp =
                    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

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
            );
          }),
          const SizedBox(height: 24),
          GetBuilder<SignUpController>(
            id: "ElevatedButton",
            builder: (_) {
              return SizedBox(
                width: double.infinity,
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
          const SizedBox(height: 24),
          const CustomOrAuthWith(text: "Or Sign Up with"),
          const SizedBox(height: 12),
          CustomGoogleFacebookIphone(
            onTapGoogle: () {
              controller.signInWithGoogle();
            },
            onTapFacebook: () {
              controller.signInWithFacebook();
            },
          ),
          const SizedBox(height: 24),
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
