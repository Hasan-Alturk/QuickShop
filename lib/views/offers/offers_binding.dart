import 'package:get/get.dart';
import 'package:quick_shop/views/offers/offers_controller.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OffersController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
