import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/views/auth/sign_up_complete/sign_up_complete_controller.dart';

class SignUpCompleteBinding extends Bindings {
  @override
  void dependencies() {
        Get.put(AuthRepo(Get.find<Dio>()));

    Get.put(SignUpCompleteController(
      authRepo: Get.find<AuthRepo>(),
    ));
  }
}
