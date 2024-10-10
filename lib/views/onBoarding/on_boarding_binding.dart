import 'package:get/get.dart';
import 'package:quick_shop/views/onBoarding/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
