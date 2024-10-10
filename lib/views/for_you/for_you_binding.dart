import 'package:get/get.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';

class ForYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForYouController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
