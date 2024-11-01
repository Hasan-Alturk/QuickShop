import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/auth/login/login_controller.dart';
import 'package:quick_shop/views/auth/widgets/bottom_auth.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/views/auth/widgets/google_facebook_iphone.dart';
import 'package:quick_shop/views/auth/widgets/custom_initl_phone_number.dart';
import 'package:quick_shop/views/auth/widgets/or_auth_with.dart';
import 'package:quick_shop/views/auth/widgets/custom_text_field.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class LoginWithPhoneView extends GetView<LoginController> {
  const LoginWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.02),
          _buildPhoneNumberField(),
          SizedBox(height: context.screenHeight * 0.015),
          _buildPasswordField(),
          SizedBox(height: context.screenHeight * 0.015),
          _buildRememberMeAndForgetPassword(),
          SizedBox(height: context.screenHeight * 0.024),
          _buildLoginButton(context),
          SizedBox(height: context.screenHeight * 0.024),
          const OrAuthWith(text: "Or login with"),
          SizedBox(height: context.screenHeight * 0.024),
          _buildSocialMediaButtons(),
          SizedBox(height: context.screenHeight * 0.024),
          _buildBottomSignUpLink(),
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

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: controller.passwordController,
      hint: "Password",
      prefixIcon: Assets.imagesPassword,
      suffixIcon: true,
      obscureText: true,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Password is required";
        } else if (text.length < 8) {
          return "Password must be longer than 8 characters";
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

  Widget _buildRememberMeAndForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetBuilder<LoginController>(
              id: "remember_me",
              builder: (_) {
                return Checkbox(
                  value: controller.isRememberMeChecked,
                  activeColor: Get.theme.colorScheme.primary,
                  side: BorderSide(
                    color: Get.theme.colorScheme.primary,
                    width: 2,
                  ),
                  onChanged: (bool? value) {
                    controller.toggleRememberMe(value!);
                  },
                );
              },
            ),
            Text(
              "Remember me",
              style: AppTextStyles().medium12().copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            controller.goToForgetPassword();
          },
          child: Text(
            "Forget Password?",
            style: AppTextStyles()
                .medium12()
                .copyWith(color: Get.theme.colorScheme.primary),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GetBuilder<LoginController>(
      id: "login_button",
      builder: (_) {
        return SizedBox(
          width: context.screenWidth,
          height: 50,
          child: CustomButton(
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                controller.loginWithPhone(
                  phone: controller.fullNumber,
                  password: controller.passwordController.text,
                );
              } else {
                log("Error from validation");
              }
            },
            text: "Login",
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

  Widget _buildBottomSignUpLink() {
    return BottomAuth(
      title: 'Didn’t have an account ?',
      subTitle: '  Sign Up',
      onTap: () {
        controller.goToSignUp();
      },
    );
  }
}
