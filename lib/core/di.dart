import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tdd_templete/core/helper/cache_helper.dart';
import 'package:tdd_templete/core/network/dio_factory.dart';
import 'package:tdd_templete/core/network/network_info.dart';
import 'package:tdd_templete/features/data/data_source/local_data_source.dart';
import 'package:tdd_templete/features/data/data_source/remote_data_source.dart';
import 'package:tdd_templete/features/data/network/app_api.dart';
import 'package:tdd_templete/features/data/repository/repository_impl.dart';
import 'package:tdd_templete/features/domain/repository/repository.dart';
import 'package:tdd_templete/features/presention/home/controller/home_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_templete/features/presention/home/home_view_model.dart';

final instance = GetIt.instance;

Future<void> initApp() async {
  await CacheHelper.init();
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSources>(
      () => RemoteDataSourcesImpl(appServiceClient: instance()));
  instance.registerLazySingleton<http.Client>(() => http.Client());
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),instance(),instance()));
  // instance.registerLazySingleton<HomeController>(() => HomeController(repository: instance()));
    Get.lazyPut(()=>HomeController(repository: instance()));
 //  instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer());
}
