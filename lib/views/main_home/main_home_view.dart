import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/main_home/main_home_controller.dart';
import 'package:quick_shop/core/widgets/custom_bottom_navigation_bar.dart';

class MainHomeView extends GetView<MainHomeController> {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return GetBuilder<MainHomeController>(
      id: "main_home_screen",
      builder: (_) {
        return controller.screens[controller.pageIndex];
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return GetBuilder<MainHomeController>(
      id: "bottom_navigation_bar",
      builder: (_) {
        return CustomBottomNavigationBar(
          currentIndex: controller.pageIndex,
          onTap: controller.changePage,
        );
      },
    );
  }
}
