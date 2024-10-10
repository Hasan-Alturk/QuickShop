import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/core/services/shared_storage.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';

class SignUpCompleteController extends GetxController {
  final AuthRepo authRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool isChanged = false;
  String token = "";

  bool isRememberMeChecked = true;

  SignUpCompleteController({required this.authRepo});

  Future<void> signUpWithEmailAndPhone({
    required String token,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    token = (await SharedStorage.getToken())!;

    try {
      isLoading = true;
      update(["ElevatedButton"]);
      User user = await authRepo.signUp(
        token: token,
        name: name,
        password: password,
        passwordConfirmation: confirmPassword,
      );
      await SharedStorage.saveUser(user);
      isLoading = false;
      update(["ElevatedButton"]);

      CustomSnackbar.showSuccessSnackbar('Sign Up complete successfully');
      Get.offAllNamed("/main_home");
    } on ErrorHandler catch (e) {
      isLoading = false;
      update(["ElevatedButton"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
