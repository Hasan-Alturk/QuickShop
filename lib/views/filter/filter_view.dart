import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/views/filter/filter_controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Car Shop"),
      ),
      //   body: const GetBuilder<FilterController>(
      //   id: "FilterView",
      // builder: (_) {
      //   switch (controller.widgetState) {
      //     case WidgetState.loading:
      //       return const Center(child: CircularProgressIndicator());
      //     case WidgetState.error:
      //       return Center(
      //         child: ElevatedButton(
      //             onPressed: controller.filter,
      //             child: const Text("Try Again")),
      //       );
      //     case WidgetState.empty:
      //       return const Center(
      //         child: Text("No cars"),
      //       );
      //     default:
      //       return ListView.separated(
      //         padding: const EdgeInsets.all(20),
      //         separatorBuilder: (context, index) {
      //           return const SizedBox(height: 15);
      //         },
      //         itemCount: controller.cars.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return CarCard(car: controller.cars[index]);
      //         },
      //       );
      //   }
      //  }
      // ),
    );
  }
}
