import 'package:gapopa_test/core/network/api_base_helper.dart';

import '../../../../config.dart';
import '../models/home_model.dart';

class HomeRemoteDataSource {
  ApiBaseHelper apiBaseHelper;
  HomeRemoteDataSource(this.apiBaseHelper);
  Future<List<HomeModel>> fetchItems(page) async {
    final response = await apiBaseHelper
        .get("?key=${AppConfig.ACCESS_TOKEN}&image_type=photo&page=$page");
    return (response['hits'] as List)
        .map((e) => HomeModel.fromJson(e))
        .toList();
  }
}
