import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import '../../data/models/home_model.dart'; 
import '../../domain/usecases/gethomedata.dart';

class HomeController extends GetxController {
  GetHomeData homeData;
  HomeController(this.homeData);
  var isLoading = false.obs;
  var isPageUpdating = false.obs;
  var currentPage = 1.obs;
  late var gridData = <HomeModel>[].obs;
  final ScrollController scrollController = ScrollController(); 
  @override
  void onInit() async {
    super.onInit();
    fetchItems();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nextPage();
      }
    });
  }

  Future<void> fetchItems() async {
    try {
        if (gridData.isEmpty) {
        isLoading(true);
     }
      final data = await homeData.getData(currentPage.value, isLoading);
      gridData.addAll(data);
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }


 
  void nextPage() async { 
    currentPage.value++;
    isPageUpdating.value = true;
   await fetchItems(); 
    isPageUpdating.value = false;
 
  }
}

 