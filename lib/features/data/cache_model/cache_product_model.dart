import 'package:hive/hive.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';

part 'cache_product_model.g.dart';

@HiveType(typeId: 10)
class ProductCache extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  List<ProductModel> product;

  ProductCache(this.id, this.product);
}
