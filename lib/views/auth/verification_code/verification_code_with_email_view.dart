import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_controller.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_header_auth.dart';
import 'package:quick_shop/widgets/otp_text_field.dart';
import 'package:quick_shop/widgets/timer_button.dart';

class VerificationCodeWithEmailView
    extends GetView<VerificationCodeController> {
  const VerificationCodeWithEmailView({super.key});

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
                height: height * 0.3,
                child: const CustomHeaderAuth(
                  image: Assets.imagesLogoWhiteSmall,
                  title: "Verification Code",
                  subTitle: "Inter your OTP code",
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
                          GetBuilder<VerificationCodeController>(
                            builder: (_) {
                              return OtpTextField(
                                length: 6,
                                onCompleted: (String code) {
                                  controller.otp = code;
                                },
                                onChanged: (String code) {
                                  controller.otp = code;
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn’t receive code?   ',
                                style:
                                    AppTextStyles().medium12(context).copyWith(
                                          color: AppColors.secondryTextColor,
                                        ),
                              ),
                              GetBuilder<VerificationCodeController>(
                                id: "TimerButton",
                                builder: (_) {
                                  return TimerButton(
                                    label: "Resend Code",
                                    timeOutInSeconds: 30,
                                    onPressed: () {
                                      controller.reSendVerifyOtpWithEmail();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GetBuilder<VerificationCodeController>(
                            id: "ElevatedButton",
                            builder: (_) {
                              return SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: CustomButton(
                                  onPressed: () {
                                    if (controller.otp.length == 6) {
                                      controller.goToSignUpCompleteWithEmail(
                                        token: controller.token,
                                        otp: controller.otp,
                                      );
                                    }
                                  },
                                  text: "Verify",
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
