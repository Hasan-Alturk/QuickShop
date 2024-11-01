import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_controller.dart';
import 'package:quick_shop/core/widgets/custom_button.dart';
import 'package:quick_shop/views/auth/widgets/header_auth.dart';
import 'package:quick_shop/views/auth/widgets/otp_text_field.dart';
import 'package:quick_shop/views/auth/widgets/timer_button.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class VerificationCodeWithPhoneView
    extends GetView<VerificationCodeController> {
  const VerificationCodeWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              _buildHeaderAuth(context),
              _buildBody(context),
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
        title: "Enter your OTP code",
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.024),
                _buildOtpTextField(),
                SizedBox(height: context.screenHeight * 0.024),
                _buildResendCodeRow(context),
                SizedBox(height: context.screenHeight * 0.024),
                _buildVerifyButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpTextField() {
    return GetBuilder<VerificationCodeController>(
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
    );
  }

  Widget _buildResendCodeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn’t receive code?   ',
          style: AppTextStyles().medium12().copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        GetBuilder<VerificationCodeController>(
          id: "timer_button",
          builder: (_) {
            return TimerButton(
              label: "Resend Code",
              timeOutInSeconds: 30,
              onPressed: () {
                controller.reSendVerifyOtpWithPhone(
                  fullNumber: Get.arguments['fullNumber'],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return GetBuilder<VerificationCodeController>(
      id: "verify_button",
      builder: (_) {
        return SizedBox(
          width: context.screenWidth,
          height: 50,
          child: CustomButton(
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                controller.goToSignUpCompleteWithPhone(
                  fullNumber: Get.arguments['fullNumber'],
                  otp: controller.otp,
                );
              } else {
                log("Error From validate");
              }
            },
            text: "Verify",
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
