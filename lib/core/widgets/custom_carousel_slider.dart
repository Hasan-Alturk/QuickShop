import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_constants.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<Widget> items;
  final CarouselSliderController carouselController;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  const CustomCarouselSlider({
    super.key,
    required this.items,
    required this.carouselController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      carouselController: carouselController,
      disableGesture: true,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        viewportFraction: 1,
        initialPage: 0,
        height: screenHeight * 0.15,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
