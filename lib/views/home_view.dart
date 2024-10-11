import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/text_style.dart';
import '../controllers/home_controller.dart';
import '../models/home_model.dart';

//home
class HomeView extends GetView {
  var controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    // Calculate the number of columns with a minimum of 2
    int columnsCount =
        ((MediaQuery.of(context).size.width / 200) + 0.5).floor();
    columnsCount = columnsCount < 2 ? 2 : columnsCount;

    double itemWidth = MediaQuery.of(context).size.width / columnsCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: MyTextStyle.heading,
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.gridData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columnsCount,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final HomeModel item = controller.gridData[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: itemWidth,
                              height: itemWidth,
                              child: Stack(
                                children: [
                                  Image.network(
                                    item.largeImageURL ?? "",
                                    fit: BoxFit.cover,
                                    width: itemWidth,
                                    height: itemWidth,
                                  ),
                                  Positioned(
                                    top: 8.0,
                                    right: 8.0,
                                    child: Row(
                                      children: [
                                        Icon(Icons.favorite_border,
                                            color: Colors.white),
                                        SizedBox(width: 4.0),
                                        Text(
                                          '${item.likes}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8.0,
                                    left: 8.0,
                                    child: Row(
                                      children: [
                                        Icon(Icons.visibility,
                                            color: Colors.white),
                                        SizedBox(width: 4.0),
                                        Text(
                                          '${item.views ?? ""}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            Visibility(
              visible: controller.isPageUpdating.value,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
