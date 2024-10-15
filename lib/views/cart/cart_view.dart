import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/cart/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("Cart"))],
      ),
    );
  }
}
