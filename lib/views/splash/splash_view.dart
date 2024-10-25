import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesSplach),
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          Center(
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
                SizedBox(height: screenHeight * 0.05),
                CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
