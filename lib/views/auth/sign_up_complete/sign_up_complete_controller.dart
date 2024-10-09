import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';

class SignUpCompleteController extends GetxController {
  final AuthRepo authRepo;
  // final StorageService storageService;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String error = "";

  bool isLoading = false;
  bool isChanged = false;
  String token = "";

  bool isRememberMeChecked = true;

  SignUpCompleteController({required this.authRepo});

  Future<void> signUpWithEmail({
    required String token,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    token = (await SharedStorage.getToken())!;

    try {
      isLoading = true;
      update(["TextError", "ElevatedButton"]);
      User user = await authRepo.signUp(
        token: token,
        name: name,
        password: password,
        passwordConfirmation: confirmPassword,
      );
      log(user.toString());
      await SharedStorage.saveUser(user);
      isLoading = false;
      update(["ElevatedButton"]);

      Get.offAllNamed("/main_home");
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      error = e.toString();
      update(["TextError", "ElevatedButton"]);
    }
  }
}
