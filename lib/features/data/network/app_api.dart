import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tdd_templete/core/constant.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/products")
  Future<List<ProductModel>> getProduct();
}
