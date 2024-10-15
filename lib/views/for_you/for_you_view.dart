import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/for_you/for_you_controller.dart';

class ForYouView extends GetView<ForYouController> {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("For You"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
