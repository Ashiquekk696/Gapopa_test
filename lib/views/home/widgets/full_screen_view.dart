import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenView extends StatelessWidget {
  FullScreenView({super.key, this.imageUrl});
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: Image.network(
          imageUrl ?? "",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
