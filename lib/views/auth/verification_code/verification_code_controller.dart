import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';

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
      update(["ElevatedButton"]);

      final response =
          await authRepo.verifyOtpWithPhone(phoneNumber: fullNumber, otp: otp);
      dynamic data = response.data;
      isLoading = false;
      update(["ElevatedButton"]);

      if (data['status'] == 'approved') {
        CustomSnackbar.showSuccessSnackbar('Code accepted successfully');

        Get.toNamed("/sign_up_complete_with_phone", arguments: fullNumber);
      } else {
        CustomSnackbar.showErrorSnackbar(data['message']);
      }
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> goToSignUpCompleteWithEmail({
    required String token,
    required String otp,
  }) async {
    token = (await SharedStorage.getToken())!;
    try {
      isLoading = true;
      update(["ElevatedButton"]);

      await authRepo.verifyOtpWithEmail(token: token, otp: otp);
      isLoading = false;
      update(["ElevatedButton"]);

      CustomSnackbar.showSuccessSnackbar('Code accepted successfully');
      Get.toNamed("/sign_up_complete_with_email");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> reSendVerifyOtpWithEmail() async {
    token = (await SharedStorage.getToken())!;
    try {
      isLoading = true;
      update(["TimerButton"]);
      await authRepo.reSendVerifyOtpWithEmail(token: token);
      isLoading = false;
      update(["TimerButton"]);
      CustomSnackbar.showSuccessSnackbar(
          'Re send verify Otp on Email successfully');
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["TimerButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> reSendVerifyOtpWithPhone({required String fullNumber}) async {
    try {
      isLoading = true;
      update(["TimerButton"]);

      await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);
      isLoading = false;
      update(["TimerButton"]);

      CustomSnackbar.showErrorSnackbar(
          'Re send verify Otp on Phone Number successfully');

      // if (response.statusCode == 201) {
      //   log(response.data.toString());
      //   isLoading = false;
      //   update();
      //   Get.snackbar("", "تم إرسال رمز التحقق مجددا الى الرقم المحمول.");
      // } else if (response.statusCode == 400) {
      //   log(response.data.toString());
      //   isLoading = false;
      //   update();
      //   Get.snackbar("خطأ", "تم إرسال رمز التحقق مسبقا.");
      // } else {
      //   isLoading = false;
      //   update();
      //   Get.snackbar("خطأ", "حدث خطأ غير متوقع: ${response.statusCode}");
      // }
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
