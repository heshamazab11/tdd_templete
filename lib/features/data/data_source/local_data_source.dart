import 'package:hive_flutter/adapters.dart';
import 'package:tdd_templete/core/constant.dart';
import 'package:tdd_templete/features/data/cache_model/cache_product_model.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';

abstract class LocalDataSource {
  Future<Box> Openbox();

  Future<List<ProductCache>> getCache();

  Future<void> AddCache(ProductCache modelcache);

  Future<void> deleteLocal(var tittle);
}

class LocalDataSourceImplementer implements LocalDataSource {
  @override
  Future<void> AddCache(ProductCache modelcache) async {
    // TODO: implement AddCache
    deleteLocal(modelcache.id);
    final box = await Openbox();
    await box.add(modelcache);

    // print("add : ${modelcache.value}");
  }

  @override
  Future<Box> Openbox() async {
    // TODO: implement Openbox
    var box = await Hive.openBox<ProductCache>(Constant.localKey);
    return box;
  }

  @override
  Future<void> deleteLocal(tittle) async {
    // TODO: implement deleteLocal

    final box = await Openbox();
    final Map<dynamic, dynamic> deliveriesMap = box.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.key == tittle) {
        desiredKey = key;
      }
    });
    box.delete(desiredKey);
  }

  @override
  Future<List<ProductCache>> getCache() async {
    // TODO: implement getCache
    final box = await Openbox();
    List<ProductCache> model = box.values.cast<ProductCache>().toList();

    return model;
  }
}
