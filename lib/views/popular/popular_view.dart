import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/views/popular/popular_controller.dart';

class PopularView extends GetView<PopularController> {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      appBar: AppBar(
        title: const Text("Populer"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
