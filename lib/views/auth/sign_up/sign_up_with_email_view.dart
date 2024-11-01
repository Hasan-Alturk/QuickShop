import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/views/auth/widgets/bottom_auth.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/views/auth/widgets/google_facebook_iphone.dart';
import 'package:quick_shop/views/auth/widgets/or_auth_with.dart';
import 'package:quick_shop/views/auth/widgets/custom_text_field.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class SignUpWithEmailView extends GetView<SignUpController> {
  const SignUpWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.024),
          _buildEmailField(),
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

  Widget _buildEmailField() {
    return CustomTextField(
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
