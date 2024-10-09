import 'package:get/get.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_controller.dart';

class FlashSaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FlashSaleController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
