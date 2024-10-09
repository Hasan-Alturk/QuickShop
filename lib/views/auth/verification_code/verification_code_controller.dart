import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';

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
      update();

      final response =
          await authRepo.verifyOtpWithPhone(phoneNumber: fullNumber, otp: otp);
      log(response.statusCode.toString());
      dynamic data = response.data;
      isLoading = false;
      update();

      if (data['status'] == 'approved') {
        Get.toNamed("/sign_up_complete_with_phone", arguments: fullNumber);
      } else {
        Get.snackbar("خطأ", "فشل في تطابق رمز التحقق. حاول مرة أخرى.");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> goToSignUpCompleteWithEmail({
    required String token,
    required String otp,
  }) async {
    token = (await SharedStorage.getToken())!;
    try {
      isLoading = true;
      update();

      final response =
          await authRepo.verifyOtpWithEmail(token: token, otp: otp);

      if (response.statusCode == 200) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.toNamed("/sign_up_complete_with_email");
      } else if (response.statusCode == 400) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.snackbar("خطأ", "تم إرسال رمز التحقق مسبقا.");
      } else {
        isLoading = false;
        update();
        Get.snackbar("خطأ", "حدث خطأ غير متوقع: ${response.statusCode}");
      }
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      Get.snackbar("خطأ", e.message);
    } catch (e) {
      log("Unexpected Error: $e");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    } finally {
      isLoading = false; // تأكد من إعادة ضبط isLoading دائمًا
      update();
    }
  }

  Future<void> reSendVerifyOtpWithEmail() async {
    token = (await SharedStorage.getToken())!;
    try {
      isLoading = true;
      update();
      final response = await authRepo.reSendVerifyOtpWithEmail(token: token);

      if (response.statusCode == 200) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.snackbar("", "تم إرسال رمز التحقق مجددا الى البريد الالكتروني.");
      } else if (response.statusCode == 400) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.snackbar("خطأ", "تم إرسال رمز التحقق مسبقا.");
      } else {
        isLoading = false;
        update();
        Get.snackbar("خطأ", "حدث خطأ غير متوقع: ${response.statusCode}");
      }
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      Get.snackbar("خطأ", e.message);
    } catch (e) {
      log("Unexpected Error: $e");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    } finally {
      isLoading = false; // تأكد من إعادة ضبط isLoading دائمًا
      update();
    }
  }

  Future<void> reSendVerifyOtpWithPhone({required String fullNumber}) async {
    try {
      isLoading = true;
      update();
      final response =
          await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);

      if (response.statusCode == 201) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.snackbar("", "تم إرسال رمز التحقق مجددا الى الرقم المحمول.");
      } else if (response.statusCode == 400) {
        log(response.data.toString());
        isLoading = false;
        update();
        Get.snackbar("خطأ", "تم إرسال رمز التحقق مسبقا.");
      } else {
        isLoading = false;
        update();
        Get.snackbar("خطأ", "حدث خطأ غير متوقع: ${response.statusCode}");
      }
    } on ExceptionHandler catch (e) {
      log("Error: $e");
    } catch (e) {
      log("Unexpected Error: $e");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    }
  }
}
