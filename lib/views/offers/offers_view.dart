import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/offers/offers_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
        titleTextStyle: AppTextStyles()
            .bold16(context)
            .copyWith(color: Get.theme.primaryColor),
      ),
      body: SafeArea(
        child: GetBuilder<OffersController>(
          id: "offers",
          builder: (_) {
            return Skeletonizer(
              enabled: controller.isLoadingOffers,
              containersColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: controller.offersImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CachedNetworkImage(
                        imageUrl: controller.offersImages[index],
                        fit: BoxFit.contain,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
