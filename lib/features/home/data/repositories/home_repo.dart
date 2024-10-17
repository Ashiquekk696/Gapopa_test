import '../models/home_model.dart';

abstract class HomeRepository{
  Future<List<HomeModel>> fetchItems(int page);
}