import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/auth/sign_up_complete/sign_up_complete_controller.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_header_auth.dart';
import 'package:quick_shop/widgets/custom_text_field.dart';

class SignUpCompleteWithPhoneView extends GetView<SignUpCompleteController> {
  const SignUpCompleteWithPhoneView({
    super.key,
  });

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
                  title: "Complete Sign Up",
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          CustomTextField(
                            controller: controller.nameController,
                            hint: "Name",
                            prefixIcon: Assets.imagesName,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Name is required";
                              }
                              return null;
                            },
                            onChanged: (_) {
                              if (controller.isChanged) {
                                controller.formKey.currentState!.validate();
                              }
                            },
                          ),
                          const SizedBox(height: 12),
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
                              }
                              //  else if (!RegExp(
                              //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()]).{8,}$')
                              //     .hasMatch(text)) {
                              //   return "The password must contain at least one lowercase letter, one uppercase letter, and one symbol.";
                              // }
                              else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomTextField(
                            controller: controller.confirmPasswordController,
                            hint: "Confirm Password",
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
                              }
                              //  else if (!RegExp(
                              //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()]).{8,}$')
                              //     .hasMatch(text)) {
                              //   return "The password must contain at least one lowercase letter, one uppercase letter, and one symbol.";
                              // }
                              else if (text !=
                                  controller.passwordController.text) {
                                return "Passwords do not match";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          GetBuilder<SignUpCompleteController>(
                            id: "ElevatedButton",
                            builder: (_) {
                              return SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: CustomButton(
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.signUpWithEmailAndPhone(
                                        token: controller.token,
                                        name: controller.nameController.text,
                                        password:
                                            controller.passwordController.text,
                                        confirmPassword: controller
                                            .confirmPasswordController.text,
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
                        ],
                      ),
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
