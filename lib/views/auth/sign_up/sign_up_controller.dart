import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';

class SignUpController extends GetxController {
  final AuthRepo authRepo;
  PageController pageController = PageController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
      update(["ElevatedButton"]);

      await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);
      // Map<String, dynamic> responseData = response.data;
      // String token = responseData['token'];
      // await SharedStorage.saveToken(token: token);
      isLoading = false;
      update(["ElevatedButton"]);
      Get.toNamed(
        "/verification_code_with_phone",
        arguments: {'fullNumber': fullNumber},
      );
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> goToVerificationWithEmail({required String email}) async {
    try {
      isLoading = true;
      update(["ElevatedButton"]);
      final response = await authRepo.sendVerificationWithEmail(email: email);
      Map<String, dynamic> responseData = response.data;
      String token = responseData['token'];
      await SharedStorage.saveToken(token: token);
      isLoading = false;
      update(["ElevatedButton"]);
      Get.toNamed("/verification_code_with_email");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future signInWithGoogle() async {
    try {
      isLoading = true;
      update(["ElevatedButton"]);

      User user = await authRepo.signInWithGoogle();

      await SharedStorage.saveUser(user);

      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future signInWithFacebook() async {
    try {
      isLoading = true;
      update(["ElevatedButton"]);

      User user = await authRepo.signInWithFacebook();

      await SharedStorage.saveUser(user);

      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
