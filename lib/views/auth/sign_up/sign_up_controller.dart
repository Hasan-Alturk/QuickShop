import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';

class SignUpController extends GetxController {
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PageController pageController = PageController();

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


  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void jumpToPage(int index) {
    pageController.jumpToPage(
      index,
    );
    onPageChanged(index);
  }

  void goToLogin() {
    Get.toNamed('/login');
  }

  void goToSetNewPassword() {
    Get.toNamed("sign_up_complete");
  }

  Future<void> goToVerificationCodeWithPhone(
      {required String fullNumber}) async {
    try {
      isLoading = true;
      update(["sign_up_button"]);

      final response =
          await authRepo.sendVerificationWithPhone(phoneNumber: fullNumber);
      Map<String, dynamic> responseData = response.data;
      String token = responseData['token'];
      await Prefs.saveToken(token: token);
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showSuccessSnackbar(
          'Verification code sent on Phone Number successfully');

      Get.toNamed(
        "/verification_code_with_phone",
        arguments: {'fullNumber': fullNumber},
      );
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> goToVerificationWithEmail({required String email}) async {
    try {
      isLoading = true;
      update(["sign_up_button"]);

      final response = await authRepo.sendVerificationWithEmail(email: email);
      Map<String, dynamic> responseData = response.data;
      String token = responseData['token'];
      await Prefs.saveToken(token: token);

      isLoading = false;
      update(["sign_up_button"]);

      CustomSnackbar.showSuccessSnackbar(
          'Verification code sent on Email successfully');

      Get.toNamed("/verification_code_with_email");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future signInWithGoogle() async {
    try {
      isLoading = true;
      update(["sign_up_button"]);

      User user = await authRepo.loginWithGoogle();

      await Prefs.saveUser(user);

      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showSuccessSnackbar('Sign in with Google successfully');

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future signInWithFacebook() async {
    try {
      isLoading = true;
      update(["sign_up_button"]);

      User user = await authRepo.loginWithFacebook();

      await Prefs.saveUser(user);

      isLoading = false;
      update(["sign_up_button"]);

      CustomSnackbar.showSuccessSnackbar('Sign in with Facebook successfully');
      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
