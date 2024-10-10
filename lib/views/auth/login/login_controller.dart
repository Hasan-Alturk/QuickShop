import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';

class LoginController extends GetxController {
  final AuthRepo authRepo;
  PageController pageController = PageController();

  // final StorageService storageService;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showTextFieldEmail = true;
  String fullNumber = "";

  String? error;

  bool isLoading = false;
  bool isChanged = false;

  bool isRememberMeChecked = true;

  int currentPage = 0;

  LoginController({required this.authRepo});

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    onPageChanged(index);
  }

  void toggleRememberMe(bool value) {
    isRememberMeChecked = value;
    update();
  }

  void goToForgetPassword() {
    Get.toNamed("/forget_password");
  }

  void goToSignUp() {
    Get.toNamed("/sign_up");
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
    } on ExceptionHandler catch (e) {
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
    } on ExceptionHandler catch (e) {
      log(e.message);
      Get.snackbar('Error', '$e');
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }

  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      update(["TextError", "ElevatedButton"]);
      User user = await authRepo.login(
        login: email,
        password: password,
      );
      log(user.toString());
      await SharedStorage.saveUser(user);
      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ExceptionHandler catch (e) {
      log(e.message);
      Get.snackbar('Error', '$e');
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }

  Future<void> loginWithPhone(
      {required String phone, required String password}) async {
    try {
      isLoading = true;
      update(["TextError", "ElevatedButton"]);
      User user = await authRepo.login(
        login: phone,
        password: password,
      );
      log(user.toString());
      await SharedStorage.saveUser(user);
      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ExceptionHandler catch (e) {
      log(e.message);
      Get.snackbar('Error', '$e');
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }
}
