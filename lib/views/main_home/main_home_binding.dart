import 'package:get/get.dart';
import 'package:quick_shop/views/home/home_binding.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeController());

    HomeBinding().dependencies();
  }
}
