import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/text_style.dart';
import '../../controllers/home_controller.dart';
import 'widgets/image_list.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put<HomeController>(HomeController());
    // Calculate the number of columns with a minimum of 2
    int columnsCount = ((MediaQuery.sizeOf(context).width / 200) + 0.5).floor();
    columnsCount = columnsCount < 2 ? 2 : columnsCount;

    double itemWidth = MediaQuery.of(context).size.width / columnsCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: MyTextStyle.heading,
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: ImageList(controller: controller, columnsCount: columnsCount, itemWidth: itemWidth),
                    ),
            ),
            Visibility(
              visible: controller.isPageUpdating.value,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}