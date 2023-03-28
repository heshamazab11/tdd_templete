import 'package:tdd_templete/core/network/error_handler.dart';

class Failure {
  late int code; // 200 or 400
  late String message;

  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.unKnown, ResponseMessage.unknown);
}
