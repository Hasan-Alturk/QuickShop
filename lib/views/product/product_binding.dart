import 'package:get/get.dart';
import 'package:quick_shop/views/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
