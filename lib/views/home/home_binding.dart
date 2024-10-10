import 'package:get/get.dart';
import 'package:quick_shop/views/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    // Get.put(HomeRepo(dio: Get.find<Dio>()));
    //  CarsBinding().dependencies();
  }
}
