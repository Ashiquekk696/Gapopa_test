

import 'package:flutter/material.dart';
import 'package:gapopa_test/controllers/home_controller.dart';
import 'package:gapopa_test/views/home/widgets/image_card.dart';

import '../../../models/home_model.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    super.key,
    required this.controller,
    required this.columnsCount,
    required this.itemWidth,
  });

  final HomeController controller;
  final int columnsCount;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller.scrollController,
      itemCount: controller.gridData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final HomeModel item = controller.gridData[index];
        return ImageCard(itemWidth: itemWidth, item: item);
      },
    );
  }
}
