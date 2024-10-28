import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/repo/home_repo.dart';
import 'package:quick_shop/core/services/local_notification_controller.dart';
import 'package:quick_shop/views/home/home_controller.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeRepo(dio: Get.find<Dio>()), permanent: true);

    Get.put(LocalNotificationController());

    Get.put(
      HomeController(
        mainController: Get.find<MainHomeController>(),
        homeRepo: Get.find<HomeRepo>(),
        notificationController: Get.find<LocalNotificationController>(),
      ),
    );
  }
}
