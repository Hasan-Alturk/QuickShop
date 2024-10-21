import 'package:get/get.dart';
import 'package:quick_shop/views/filter/filter_controller.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FilterController());
  }
}
