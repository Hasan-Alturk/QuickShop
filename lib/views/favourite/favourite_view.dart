import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/favourite/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("Favourite"))],
      ),
    );
  }
}
