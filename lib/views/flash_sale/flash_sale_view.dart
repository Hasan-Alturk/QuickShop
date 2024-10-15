import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_controller.dart';

class FlashSaleView extends GetView<FlashSaleController> {
  const FlashSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash Sale"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
