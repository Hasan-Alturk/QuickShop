import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.27,
                child: const CustomHeaderAuth(
                  image: Assets.imagesLogoWhiteSmall,
                  title: "Inter your OTP code",
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  decoration: ShapeDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    shape: const RoundedRectangleBorder(
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
                          SizedBox(height: height * 0.024),
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
                          SizedBox(height: height * 0.024),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn’t receive code?   ',
                                style: AppTextStyles()
                                    .medium12()
                                    .copyWith(
                                      color: Get.theme.colorScheme.onSurface,
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
                          SizedBox(height: height * 0.024),
                          GetBuilder<VerificationCodeController>(
                            id: "ElevatedButton",
                            builder: (_) {
                              return SizedBox(
                                width: width,
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
