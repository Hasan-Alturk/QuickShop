import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/core/models/review.dart';

class RatingReviewController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = []; // قائمة لتخزين الصور المختارة

  // متغيرات لعرض الملخص وعدد التوصيات

  // قائمة المراجعات
  List<Review> reviews = [];

  @override
  void onInit() {
    super.onInit();
    // هنا نقوم بإضافة بعض المراجعات كمثال
    reviews.addAll(
      [
        Review(
          userName: "Helene Moore",
          date: "June 5, 2019",
          reviewText:
              "The dress is great! Veryt! Very classy and cThe dress is great! Veryt! Very classy and cThe dress is great! Veryt! Very classy and cThe dress is great! Veryt! Very classy and cThe dress is great! Veryt! Very classy and comfortable..t! Very classy and comfortable..t! Very classy and comfortable..t! Very classy and comfortable..t! Very classy and comfortable.. classy and comfortable...",
          rating: 4.5,
          imageUrls: [
            Assets.imagesArduino,
            Assets.imagesBurgur,
            Assets.imagesBurgur,
            Assets.imagesDress,
            Assets.imagesBurgur,
          ],
        ),
        Review(
          userName: "Hasan Moore",
          date: "June 5, 2024",
          reviewText:
              "Tesssss is great! Very classy and comgreat! Very classy and com  dress is great! Very classy and comfortable...",
          rating: 2.0,
          imageUrls: [
            Assets.imagesDress,
            Assets.imagesBurgur,
          ],
        ),
      ],
    );
  }

  Future<void> pickImages() async {
    final List<XFile> pickedImages = await picker.pickMultiImage();

    images.addAll(pickedImages);

    update(["pick_images"]);
  }
}
