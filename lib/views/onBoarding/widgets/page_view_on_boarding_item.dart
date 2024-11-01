import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class PageViewOnBoardingItem extends StatefulWidget {
  const PageViewOnBoardingItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String image;
  final String subtitle;
  final String title;

  @override
  PageViewOnBoardingItemState createState() => PageViewOnBoardingItemState();
}

class PageViewOnBoardingItemState extends State<PageViewOnBoardingItem>
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
        _buildImage(),
        SizedBox(height: context.screenHeight * 0.1),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildImage() {
    return Expanded(
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
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: context.screenHeight * 0.02),
            _buildSubtitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SlideTransition(
      position: _titleSlideAnimation,
      child: Text(
        widget.title,
        style: AppTextStyles()
            .blackBold24()
            .copyWith(color: Get.theme.colorScheme.primary),
      ),
    );
  }

  Widget _buildSubtitle() {
    return SlideTransition(
      position: _subtitleSlideAnimation,
      child: Text(
        widget.subtitle,
        style: AppTextStyles().medium14().copyWith(
              color: Get.theme.colorScheme.onSurface,
            ),
      ),
    );
  }
}
