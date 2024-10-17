import 'package:flutter/material.dart';
import 'package:gapopa_test/core/utils/di.dart';
import 'package:gapopa_test/features/home/presentation/pages/home_view.dart';
import 'package:get/get.dart';
import 'core/utils/colors.dart';
 

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
       initialBinding: AppBinding(),
      title: '',
      theme: ThemeData(
          useMaterial3: true, scaffoldBackgroundColor: AppColors.black),
      home: const HomePage(),
    );
  }
}
