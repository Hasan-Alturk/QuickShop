import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_shop/core/models/offers.dart';
import 'package:quick_shop/core/repo/home_repo.dart';
import 'package:quick_shop/core/services/error_handler.dart';
import 'package:quick_shop/widgets/custom_snack_bar.dart';

class OffersController extends GetxController {
  OffersController({required this.homeRepo});

  final HomeRepo homeRepo;
  bool isLoadingOffers = true;
  final List<String> offersImages = [];

  @override
  void onInit() async {
    super.onInit();

    await getOffers();
  }

  Future<void> getOffers() async {
    try {
      Offers offers = await homeRepo.getOffers();
      for (Offer offer in offers.data) {
        offersImages.add(offer.xxlargeUrl);
      }

      isLoadingOffers = false;
      update(["offers"]);
    } on ErrorHandler catch (e) {
      isLoadingOffers = false;
      update(["offers"]);
      CustomSnackbar.showErrorSnackbar('$e');
    }
  }
}
