import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/auth/login/login_controller.dart';
import 'package:quick_shop/widgets/custom_bottom_auth.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_google_facebook_iphone.dart';
import 'package:quick_shop/widgets/custom_or_auth_with.dart';
import 'package:quick_shop/widgets/custom_text_field.dart';

class LoginWithEmailView extends GetView<LoginController> {
  const LoginWithEmailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.024),
          GetBuilder<LoginController>(builder: (_) {
            return CustomTextField(
              controller: controller.emailController,
              hint: "Email",
              prefixIcon: Assets.imagesEmail,
              validator: (text) {
                RegExp regExp =
                    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                if (text == null || text.isEmpty) {
                  return "Email is required";
                } else if (!regExp.hasMatch(text)) {
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
          SizedBox(height: height * 0.012),
          CustomTextField(
            controller: controller.passwordController,
            hint: "Password",
            prefixIcon: Assets.imagesPassword,
            suffixIcon: true,
            obscureText: true,
            onChanged: (_) {
              if (controller.isChanged) {
                controller.formKey.currentState!.validate();
              }
            },
            validator: (text) {
              if (text == null || text.isEmpty) {
                return "Password is required";
              } else if (text.length < 8) {
                return "Password must be longer than 8 char";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: height * 0.012),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GetBuilder<LoginController>(
                    builder: (_) {
                      return Checkbox(
                        value: controller.isRememberMeChecked,
                        activeColor: AppColors.primaryColor,
                        side: const BorderSide(
                          color: AppColors.primaryColor,
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
                    style: AppTextStyles().medium12(context).copyWith(
                          color: AppColors.secondryTextColor,
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
                      .medium12(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.024),
          GetBuilder<LoginController>(
            id: "ElevatedButton",
            builder: (_) {
              return SizedBox(
                width: width,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.loginWithEmail(
                        email: controller.emailController.text,
                        password: controller.passwordController.text,
                      );
                    } else {
                      log("Error From validate");
                    }
                  },
                  text: "Login",
                  isLoading: controller.isLoading,
                ),
              );
            },
          ),
          SizedBox(height: height * 0.024),
          const CustomOrAuthWith(text: "Or login with"),
          SizedBox(height: height * 0.024),
          CustomGoogleFacebookIphone(
            onTapGoogle: () {
              controller.signInWithGoogle();
            },
            onTapFacebook: () {
              controller.signInWithFacebook();
            },
          ),
          SizedBox(height: height * 0.024),
          CustomBottomAuth(
            title: 'Didn’t have an account ?',
            subTitle: '  Sign Up',
            onTap: () {
              controller.goToSignUp();
            },
          ),
        ],
      ),
    );
  }
}
