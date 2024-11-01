import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/views/splash/splash_controller.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Stack(
        children: [
          _buildSplashBackground(context), 
          _buildSplashContent(context),
        ],
      ),
    );
  }

  Widget _buildSplashBackground(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: Image.asset(
        Assets.imagesSplach,
        repeat: ImageRepeat.repeat,
      ),
    );
  }

  Widget _buildSplashContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Opacity(
              opacity: controller.fadeAnimation.value,
              child: SvgPicture.asset(
                Assets.imagesLogoWhite,
              ),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.05),
          CircularProgressIndicator(
            strokeWidth: 3,
            color: Get.theme.colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
