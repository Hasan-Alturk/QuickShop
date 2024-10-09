import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_controller.dart';

class FlashSaleView extends GetView<FlashSaleController> {
  const FlashSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      appBar: AppBar(
        title: const Text("Flash Sale"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
