import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.controller,
  });

  final GetxController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (controller as dynamic).items,
      carouselController: (controller as dynamic).carouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1,
        initialPage: 0,
        height: 180,
        onPageChanged: (index, reason) {
          (controller as dynamic).updatePageIndex(index);
        },
      ),
    );
  }
}
