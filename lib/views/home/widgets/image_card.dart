import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gapopa_test/views/home/widgets/full_screen_view.dart';
import 'package:get/get.dart';
import '../../../models/home_model.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.itemWidth,
    required this.item,
  });

  final double itemWidth;
  final HomeModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FullScreenView(imageUrl: item.largeImageURL,));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: itemWidth,
          height: itemWidth,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: item.largeImageURL ?? "",
                fit: BoxFit.cover,
                width: itemWidth,
                height: itemWidth,
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Row(
                  children: [
                    const Icon(Icons.favorite_border, color: Colors.white),
                    const SizedBox(width: 4.0),
                    Text(
                      '${item.likes}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 8.0,
                child: Row(
                  children: [
                    const Icon(Icons.visibility, color: Colors.white),
                    const SizedBox(width: 4.0),
                    Text(
                      '${item.views ?? ""}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
