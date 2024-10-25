import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';

class VerificationCodeController extends GetxController {
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 
  bool isLoading = false;
  String otp = "";
  String token = "";

  VerificationCodeController({required this.authRepo});
  Future<void> goToSignUpCompleteWithPhone({
    required String fullNumber,
    required String otp,
  }) async {
    try {
      isLoading = true;
      update(["verify_button"]);

      final response =
          await authRepo.verifyOtpWithPhone(phoneNumber: fullNumber, otp: otp);
      dynamic data = response.data;
      isLoading = false;
      update(["verify_button"]);

      if (data['status'] == 'approved') {
        CustomSnackbar.showSuccessSnackbar('Code accepted successfully');

        Get.toNamed("/sign_up_complete_with_phone", arguments: fullNumber);
      } else {
        CustomSnackbar.showErrorSnackbar("Invalid OTP");
      }
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["verify_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> goToSignUpCompleteWithEmail({
    required String token,
    required String otp,
  }) async {
    token = (await Prefs.getToken())!;
    try {
      isLoading = true;
      update(["verify_button"]);

      await authRepo.verifyOtpWithEmail(token: token, otp: otp);
      isLoading = false;
      update(["verify_button"]);

      CustomSnackbar.showSuccessSnackbar('Code accepted successfully');
      Get.toNamed("/sign_up_complete_with_email");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["verify_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> reSendVerifyOtpWithEmail() async {
    token = (await Prefs.getToken())!;
    try {
      isLoading = true;
      update(["timer_button"]);
      await authRepo.reSendVerifyOtpWithEmail(token: token);
      isLoading = false;
      update(["timer_button"]);
      CustomSnackbar.showSuccessSnackbar(
          'Re send verify OTP on Email successfully');
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["timer_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> reSendVerifyOtpWithPhone({required String fullNumber}) async {
    try {
      isLoading = true;
      update(["timer_button"]);

      await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);
      isLoading = false;
      update(["timer_button"]);

      CustomSnackbar.showSuccessSnackbar(
          'Re send verify OTP on Phone Number successfully');
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["timer_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
