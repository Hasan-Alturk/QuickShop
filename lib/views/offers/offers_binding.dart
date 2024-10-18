import 'package:get/get.dart';
import 'package:quick_shop/core/repo/home_repo.dart';
import 'package:quick_shop/views/offers/offers_controller.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OffersController(homeRepo: Get.find<HomeRepo>()));
  }
}
