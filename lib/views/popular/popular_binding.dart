import 'package:get/get.dart';
import 'package:quick_shop/views/popular/popular_controller.dart';

class PopularBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PopularController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
