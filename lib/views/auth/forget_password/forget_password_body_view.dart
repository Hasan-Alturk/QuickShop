import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/auth/forget_password/forget_password_controller.dart';
import 'package:quick_shop/widgets/custom_button.dart';
import 'package:quick_shop/widgets/custom_initl_phone_number.dart';
import 'package:quick_shop/widgets/custom_text_field.dart';

class ForgetPasswordBodyView extends GetView<ForgetPasswordController> {
  const ForgetPasswordBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          GetBuilder<ForgetPasswordController>(builder: (_) {
            return controller.currentPage == 0
                ? CustomTextField(
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
                  )
                : CustomIntlPhoneNumber(
                    controller: controller.phoneController,
                    formKey: controller.formKey,
                    isChanged: controller.isChanged,
                    onFullNumber: (String fullNumber) {
                      // إذا كان لديك متغير آخر في `controller` للاحتفاظ بالرقم الكامل، يمكنك تحديثه هنا
                      controller.fullNumber =
                          fullNumber; // على فرض أن لديك خاصية fullNumber في controller
                    },
                  );
          }),
          const SizedBox(height: 24),
          GetBuilder<ForgetPasswordController>(
            id: "ElevatedButton",
            builder: (_) {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.goToVerificationCode();
                    } else {
                      log("Error From validate");
                    }
                  },
                  text: "Submit",
                  isLoading: controller.isLoading,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
