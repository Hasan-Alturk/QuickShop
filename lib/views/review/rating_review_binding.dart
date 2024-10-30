import 'package:get/get.dart';
import 'package:quick_shop/views/review/rating_review_controller.dart';

class RatingReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RatingReviewController());
  }
}
