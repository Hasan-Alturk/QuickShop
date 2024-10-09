import 'package:get/get.dart';
import 'package:quick_shop/core/repo/auth_repo.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      VerificationCodeController(
        authRepo: Get.find<AuthRepo>(),
      ),
    );
  }
}
