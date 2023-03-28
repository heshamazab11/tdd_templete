import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdd_templete/features/presention/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
        body: Obx(
      () => controller.load.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(controller.products[index].title ?? ""),
                  )),
    ));
  }
}
