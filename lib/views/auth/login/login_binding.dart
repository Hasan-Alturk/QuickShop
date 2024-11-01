import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/views/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(Get.find<Dio>()));
    Get.put(
      LoginController(
        authRepo: Get.find<AuthRepo>(),
      ),
      // permanent: true,
    );
    // Get.put(LoginController());
    //  Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
