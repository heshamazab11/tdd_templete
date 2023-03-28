import 'package:dartz/dartz.dart';
import 'package:tdd_templete/core/network/failure.dart';

abstract class BaseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
