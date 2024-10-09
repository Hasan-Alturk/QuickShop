import 'package:get/get.dart';
import 'package:quick_shop/views/auth/forget_password/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    //  Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(ForgetPasswordController());
  }
}
