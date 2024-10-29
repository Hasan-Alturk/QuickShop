import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomPageViewOnBoardingItem extends StatefulWidget {
  const CustomPageViewOnBoardingItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String image;
  final String subtitle;
  final String title;

  @override
  CustomPageViewOnBoardingItemState createState() =>
      CustomPageViewOnBoardingItemState();
}

class CustomPageViewOnBoardingItemState
    extends State<CustomPageViewOnBoardingItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _subtitleSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Scale animation for the image (from 0 to 1)
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad),
    );

    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _subtitleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.1),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _titleSlideAnimation,
                  child: Text(
                    widget.title,
                    style: AppTextStyles()
                        .blackBold24()
                        .copyWith(color: Get.theme.colorScheme.primary),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.02),
                SlideTransition(
                  position: _subtitleSlideAnimation,
                  child: Text(
                    widget.subtitle,
                    style: AppTextStyles().medium14().copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
