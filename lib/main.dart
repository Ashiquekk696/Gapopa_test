import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
          useMaterial3: true, scaffoldBackgroundColor: AppColors.black),
      home: HomeView(),
    );
  }
}
