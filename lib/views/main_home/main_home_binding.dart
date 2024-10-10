import 'package:get/get.dart';
import 'package:quick_shop/views/home/home_binding.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeController(), permanent: true);
    HomeBinding().dependencies();

    //Get.put(SettingRepo(Dio()));
    // Get.put(MainHomeController(settingRepo: Get.find<SettingRepo>()),
    //     permanent: true);
    // Get.put(
    //   CurrenciesController(
    //     timeRepo: Get.put(TimeZoneRepo(dio: Get.find<Dio>())),
    //     currencyRepo: Get.find<CurrencyRepo>(),
    //     bankRepo: Get.find<BankRepo>(),
    //   ),
    // );
  }

  // void deleteController() {
  //   Get.delete<MainHomeController>();
  // }
}
