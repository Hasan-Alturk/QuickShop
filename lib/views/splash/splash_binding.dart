import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);

    Get.put(SplashController());

    // Get.put(
    //     Dio(BaseOptions(
    //         sendTimeout: 10000, receiveTimeout: 10000, connectTimeout: 10000)),
    //     permanent: true);
  }
}
