import 'package:tdd_templete/features/data/network/app_api.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';

abstract class RemoteDataSources {
  Future<List<ProductModel>> getProduct();
}

class RemoteDataSourcesImpl implements RemoteDataSources {
  late AppServiceClient appServiceClient;

  RemoteDataSourcesImpl({required this.appServiceClient});

  @override
  Future<List<ProductModel>> getProduct() {
    print("data sources : ${appServiceClient.getProduct()}");
     return appServiceClient.getProduct();
    // ProductModel productModel=ProductModel();
    // return productModel;
  }
}
