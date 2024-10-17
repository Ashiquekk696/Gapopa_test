import 'package:gapopa_test/features/home/data/models/home_model.dart';
import 'package:gapopa_test/features/home/data/repositories/home_repo.dart';
import 'package:get/get.dart';

class GetHomeData {
  HomeRepository homeRepository;
  GetHomeData(this.homeRepository);
  Future<List<HomeModel>> getData(int page, RxBool isLoading) async {
   // isLoading.value = true;
    try {
      final data = await homeRepository.fetchItems(page); 
      return data; // Return the fetched data
    } catch (e) {
      isLoading.value = false;
      return [];
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<List<HomeModel>> nextPage(RxInt currentPage, RxBool isLoading) async {
    final data = await getData(currentPage.value, isLoading);
    return data;
  }
}
