import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tdd_templete/core/constant.dart';
import 'package:tdd_templete/core/network/error_handler.dart';
import 'package:tdd_templete/core/network/failure.dart';
import 'package:tdd_templete/core/network/network_info.dart';
import 'package:tdd_templete/features/data/cache_model/cache_product_model.dart';
import 'package:tdd_templete/features/data/data_source/local_data_source.dart';
import 'package:tdd_templete/features/data/data_source/remote_data_source.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';
import 'package:tdd_templete/features/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  late final RemoteDataSources _remoteDataSources;
  late final LocalDataSource _localDataSource;
  late final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSources, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<ProductModel>>> getModel() async {
    List<ProductModel> data = [];

      try {
        final response = await _remoteDataSources.getProduct();
        if (response.isNotEmpty) {
          data.addAll(response);
          // ProductCache productCache =
          //     ProductCache(Constant.publicKey_Cache, response);
          // _localDataSource.AddCache(productCache);
          return Right(data);
        } else {
          return Left(Failure(1, ResponseMessage.badRequest));
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }


      // var localData = await _localDataSource.getCache();
      // ProductModel model = ProductModel.fromJson(localData.last.product);
      // data.add(model);
      // return Right(data);

  }
}
