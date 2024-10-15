import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  FullScreenView({super.key, this.imageUrl});
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(10),
        child: Image.network(
          imageUrl ?? "",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
