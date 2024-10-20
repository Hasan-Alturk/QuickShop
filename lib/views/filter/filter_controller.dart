import 'package:get/get.dart';
import 'package:quick_shop/core/repo/home_repo.dart';

class FilterController extends GetxController {
  HomeRepo homeRepo;
 // late FilterModel filterModel;
 // List<Car> cars = [];
 // WidgetState widgetState = WidgetState.loading;
  FilterController({
    required this.homeRepo,
  });
  @override
  void onInit() {
    filter();
    super.onInit();
  }

  Future<void> filter() async {
//    filterModel = Get.arguments["filterData"] as FilterModel;
   // try {
  //    widgetState = WidgetState.loading;
      update(["FilterView"]);
    //  cars = await homeRepo.filterCars(skip: 0, filter: filterModel);
    //  widgetState = cars.isEmpty ? WidgetState.empty : WidgetState.done;
  //  } on ExceptionHandler catch (e) {
    //  widgetState = WidgetState.error;
    //  BotToast.showText(text: e.error);
  //  }
    update(["FilterView"]);
  }
}
