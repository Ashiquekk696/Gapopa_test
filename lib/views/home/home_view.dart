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

    // Determine screen width and device type (mobile or web)
    double screenWidth = MediaQuery.sizeOf(context).width;

    // Use adaptive column count: 2 for mobile, up to 5 for web with large screens
    int columnsCount = screenWidth < 600
        ? 2 // For small screens (mobile)
        : ((screenWidth / 200) + 0.5).floor(); // For wider screens (web)

    // Limit max columns to 5
    columnsCount = columnsCount < 2
        ? 2
        : columnsCount > 5
            ? 5
            : columnsCount;

    // Calculate item width based on the number of columns
    double itemWidth = screenWidth / columnsCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: MyTextStyle.heading,
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
                      child: ImageList(
                        controller: controller,
                        columnsCount: columnsCount,
                        itemWidth: itemWidth,
                      ),
                    ),
                  ),
                  // Show loader if the page is updating
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
