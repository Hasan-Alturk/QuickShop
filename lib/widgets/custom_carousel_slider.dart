import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
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
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.items,
      carouselController: widget.carouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        viewportFraction: 1,
        initialPage: 0,
        height: 200,
        onPageChanged: widget.onPageChanged,
      ),
    );
  }
}
