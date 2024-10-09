import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(SignUpController(
      authRepo: Get.find<AuthRepo>(),
      //  storageService: Get.find<StorageService>(),
    ));
  }
}
