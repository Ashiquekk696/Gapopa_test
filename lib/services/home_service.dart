 

import '../config.dart';
import '../helpers/api_base_helper.dart';
 
import '../models/home_model.dart';

class HomeService {
  Future<List<HomeModel>> fetchItems(page) async {
    var helper = ApiBaseHelper();
    List<HomeModel> myGridData = [];
    final response = await helper
        .get("?key=${AppConfig.ACCESS_TOKEN}&image_type=photo&page=$page");
    response['hits'].forEach((e) {
      myGridData.add(HomeModel.fromJson(e));
    });
    return myGridData;
  }
}
