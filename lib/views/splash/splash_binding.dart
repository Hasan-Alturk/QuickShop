import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());

    Get.put(
      Dio(
        BaseOptions(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          connectTimeout: const Duration(seconds: 10),
        ),
      ),
      permanent: true,
    );
  }
}
