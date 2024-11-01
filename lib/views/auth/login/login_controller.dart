import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';

class LoginController extends GetxController {
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PageController pageController = PageController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showTextFieldEmail = true;
  bool isLoading = false;
  bool isChanged = false;
  bool isRememberMeChecked = true;

  String fullNumber = "";

  int currentPage = 0;

  LoginController({required this.authRepo});

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void jumpToPage(int index) {
    pageController.jumpToPage(index);
    onPageChanged(index);
  }

  void toggleRememberMe(bool value) {
    isRememberMeChecked = value;
    update(["remember_me"]);
  }

  void goToForgetPassword() {
    //  Get.toNamed("/forget_password");
  }

  void goToSignUp() {
    Get.offAndToNamed('/sign_up');
  }

  Future signInWithGoogle() async {
    try {
      isLoading = true;
      update(["login_button"]);

      User user = await authRepo.loginWithGoogle();
      await Prefs.saveUser(user);

      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showSuccessSnackbar('Sign in with Google successfully');

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future signInWithFacebook() async {
    try {
      isLoading = true;
      update(["login_button"]);

      User user = await authRepo.loginWithFacebook();

      await Prefs.saveUser(user);

      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showSuccessSnackbar('Sign in with Facebook successfully');

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      update(["login_button"]);
      User user = await authRepo.login(
        login: email,
        password: password,
      );

      await Prefs.saveUser(user);
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showSuccessSnackbar('Sign in with Email successfully');

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }

  Future<void> loginWithPhone(
      {required String phone, required String password}) async {
    try {
      isLoading = true;
      update(["login_button"]);
      User user = await authRepo.login(
        login: phone,
        password: password,
      );

      await Prefs.saveUser(user);
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showSuccessSnackbar(
          'Sign in with Phone Number successfully');

      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["login_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
