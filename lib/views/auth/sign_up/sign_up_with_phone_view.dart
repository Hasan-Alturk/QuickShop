import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';
import 'package:quick_shop/widgets/custom_bottom_auth.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_google_facebook_iphone.dart';
import 'package:quick_shop/widgets/custom_initl_phone_number.dart';
import 'package:quick_shop/widgets/custom_or_auth_with.dart';

class SignUpWithPhoneView extends GetView<SignUpController> {
  const SignUpWithPhoneView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          GetBuilder<SignUpController>(builder: (_) {
            return CustomIntlPhoneNumber(
              controller: controller.phoneController,
              formKey: controller.formKey,
              isChanged: controller.isChanged,
              onFullNumber: (String fullNumber) {
                controller.fullNumber = fullNumber;
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
                      controller.goToVerificationCodeWithPhone(
                        fullNumber: controller.fullNumber,
                      );
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
