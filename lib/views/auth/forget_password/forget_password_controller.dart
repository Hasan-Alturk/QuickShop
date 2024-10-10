import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  // final AuthRepo authRepo;
  // final StorageService storageService;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isLoading = false;
  bool isChanged = false;
  String fullNumber = "";

  int currentPage = 0;

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void goToVerificationCode() {
    Get.toNamed("/verification_code");
  }

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
