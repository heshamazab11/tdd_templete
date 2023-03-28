import 'package:dartz/dartz.dart';
import 'package:tdd_templete/core/network/failure.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';

abstract class Repository {
  Future<Either<Failure, List<ProductModel>>> getModel();
}
