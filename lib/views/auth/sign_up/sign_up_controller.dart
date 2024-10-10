import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';

class SignUpController extends GetxController {
  final AuthRepo authRepo;
  PageController pageController = PageController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String? error;
  String fullNumber = "";

  bool isLoading = false;
  bool isChanged = false;

  bool isRememberMeChecked = true;

  int currentPage = 0;

  SignUpController({
    required this.authRepo,
  });

  void updateFullNumber(String number) {
    fullNumber = number;
    update();
  }

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void animateToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    onPageChanged(index);
  }

  void goToLogin() {
    Get.back();
  }

  void goToSetNewPassword() {
    Get.toNamed("sign_up_complete");
  }

  Future<void> goToVerificationCodeWithPhone(
      {required String fullNumber}) async {
    try {
      isLoading = true;
      update();
      await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);

      isLoading = false;
      update();
      Get.toNamed(
        "/verification_code_with_phone",
        arguments: {'fullNumber': fullNumber},
      );
    } on ErrorHandler catch (e) {
      log("Error: $e");
    } catch (e) {
      log("Unexpected Error: $e");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    }
  }

  Future<void> goToVerificationWithEmail({required String email}) async {
    try {
      isLoading = true;
      update();
      final dio.Response response =
          await authRepo.sendVerificationWithEmail(email: email);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        String token = responseData['token'];
        await SharedStorage.saveToken(token: token);
        isLoading = false;
        update();
        Get.toNamed(
          "/verification_code_with_email",
          // arguments: {
          //   'currentPage': currentPage,
          // },
        );
      } else {
        isLoading = false;
        update();

        Get.snackbar("خطأ", "لم يتم إرسال رمز التحقق.");
      }
    } on ErrorHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      update();

      Get.snackbar("خطأ", e.message);
    } catch (e) {
      log("Unexpected Error: $e");

      isLoading = false;
      update();
      Get.snackbar("خطأ", "حدث خطأ غير متوقع.");
    }
  }

  Future signInWithGoogle() async {
    try {
      isLoading = true;
      update(["TextError", "ElevatedButton"]);

      User user = await authRepo.signInWithGoogle();
      log(user.toString());

      await SharedStorage.saveUser(user);

      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      log(e.message);
      Get.snackbar('Error', '$e');
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }

  Future signInWithFacebook() async {
    try {
      isLoading = true;
      update(["TextError", "ElevatedButton"]);

      User user = await authRepo.signInWithFacebook();
      log(user.toString());

      await SharedStorage.saveUser(user);

      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      log(e.message);
      Get.snackbar('Error', '$e');
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }

  // Future<void> signInWithGoogle() async {
  //   User? user = await authRepo.signInWithGoogle();
  //   // الانتقال إلى صفحة أخرى أو تحديث واجهة المستخدم باستخدام GetX
  //   if (user != null) {
  //     // الانتقال إلى صفحة أخرى أو تحديث واجهة المستخدم باستخدام GetX
  //     Get.snackbar('Success', 'Signed in as ${user.email}');
  //   } else {
  //     Get.snackbar('Error', 'Failed to sign in with Google.');
  //   }
  // }

  // Future<void> login() async {
  //   try {
  //     error = null;
  //     isLoading = true;
  //     update(["TextError", "ElevatedButton"]);
  //     // User user = await authRepo.login(
  //     //   username: usernameController.text,
  //     //   password: passwordController.text,
  //     // );
  //     // print(user.toString());
  //     // await storageService.saveUser(user);

  //     // Get.offAllNamed("/mainHome");
  //     isLoading = false;
  //     update(["ElevatedButton"]);
  //   } on ExceptionHandler catch (e) {
  //     print("Error: $e");
  //     isLoading = false;
  //     error = e.error;
  //     update(["TextError", "ElevatedButton"]);
  //   }
  // }
}
