import 'package:gapopa_test/features/home/data/models/home_model.dart';
import 'package:gapopa_test/features/home/data/repositories/home_repo.dart';

import '../../data/datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  Future<List<HomeModel>> fetchItems(int page) async {
    final response = await homeRemoteDataSource.fetchItems(page);
    return response;
  }
}
