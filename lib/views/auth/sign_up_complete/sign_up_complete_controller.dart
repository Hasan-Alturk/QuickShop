import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:quick_shop/core/widgets/custom_snack_bar.dart';

class SignUpCompleteController extends GetxController {
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String token = "";

  bool isLoading = false;
  bool isChanged = false;
  bool isRememberMeChecked = true;

  SignUpCompleteController({required this.authRepo});

  Future<void> signUpWithEmailAndPhone({
    required String token,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    token = (await Prefs.getToken())!;

    try {
      isLoading = true;
      update(["sign_up_button"]);
      User user = await authRepo.signUp(
        token: token,
        name: name,
        password: password,
        passwordConfirmation: confirmPassword,
      );
      await Prefs.saveUser(user);
      isLoading = false;
      update(["sign_up_button"]);

      CustomSnackbar.showSuccessSnackbar('Sign Up complete successfully');
      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["sign_up_button"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
