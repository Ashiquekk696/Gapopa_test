import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import '../models/home_model.dart';
import '../services/home_service.dart';

class HomeController extends GetxController {
  HomeService myGridService = HomeService();
  var isLoading = false.obs;
    var isPageUpdating = false.obs;
  var currentPage = 1.obs;
  late var gridData = <HomeModel>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    fetchItems();
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nextPage();
      }
    });
  }

  Future<void> fetchItems() async {
    try {
      if (gridData.value.isEmpty) {
        isLoading(true);
      }
      final data = await myGridService.fetchItems(currentPage.value);
      gridData.addAll(data);
    } catch (e) { 
    } finally {
      isLoading(false);
    }
  }

  void nextPage()async {
    currentPage.value++;
    isPageUpdating.value=true;
    await fetchItems();
    isPageUpdating.value=false;
    update();
  }
}
