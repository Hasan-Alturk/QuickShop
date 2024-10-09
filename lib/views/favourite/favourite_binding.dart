import 'package:get/get.dart';
import 'package:quick_shop/views/favourite/favourite_controller.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavouriteController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
