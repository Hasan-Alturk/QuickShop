import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/views/offers/offers_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenPadding),
          child: _buildOffersList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Offers"),
      titleTextStyle:
          AppTextStyles().bold16().copyWith(color: Get.theme.primaryColor),
    );
  }

  Widget _buildOffersList() {
    return GetBuilder<OffersController>(
      id: "offers",
      builder: (_) {
        return ListView.builder(
          itemCount: controller.offersImages.length,
          itemBuilder: (context, index) {
            return Skeletonizer(
              enabled: controller.isLoadingOffers,
              child: _buildOfferItem(controller.offersImages[index]),
            );
          },
        );
      },
    );
  }

  Widget _buildOfferItem(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(screenPadding / 2),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
