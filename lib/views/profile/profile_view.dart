import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/profile/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("Profile"))],
      ),
    );
  }
}
