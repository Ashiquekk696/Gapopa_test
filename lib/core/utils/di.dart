import 'package:gapopa_test/features/home/domain/usecases/gethomedata.dart';
import 'package:gapopa_test/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/domain/repositories/home_repo_impl.dart';
import '../network/api_base_helper.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() { 
       Get.lazyPut<ApiBaseHelper>(() => ApiBaseHelper());

    // Register the HomeRemoteDataSource
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSource(Get.find<ApiBaseHelper>()),
    );

    // Register the HomeRepository
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(Get.find<HomeRemoteDataSource>()),
    );

    // Register the GetHomeData use case
    Get.lazyPut<GetHomeData>(
      () => GetHomeData(Get.find<HomeRepository>()),
    );

    // Register the HomeController
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<GetHomeData>()),
    );
  }
}