import 'package:dio/dio.dart';
import 'package:tdd_templete/core/network/failure.dart';

enum DataSource {
  SUCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNET_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHERROR,
  NI_INTERNET_CONNECTION,
  UNKNOWN,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error its error from response api
      failure = _handleError(error);
    } else {
      failure = DataSource.UNKNOWN.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.forbidden:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.unAuthorised:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.notFound:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.internetErrorServer:
            return DataSource.INTERNET_SERVER_ERROR.getFailure();
          default:
            return DataSource.INTERNET_SERVER_ERROR.getFailure();
        }
      case DioErrorType.unknown:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      default:
        return DataSource.CONNECT_TIMEOUT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.unAuthorised, ResponseMessage.unauthorised);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);

      case DataSource.INTERNET_SERVER_ERROR:
        return Failure(ResponseCode.internetErrorServer,
            ResponseMessage.internetServerError);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectionTimeout);

      case DataSource.CANCEL:
        return Failure(ResponseCode.cancel, ResponseMessage.CANCEL);

      case DataSource.RECIVE_TIMEOUT:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.RECEIVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.senTimeout, ResponseMessage.SEND_TIMEOUT);

      case DataSource.CACHERROR:
        return Failure(ResponseCode.catchError, ResponseMessage.CACHERROR);

      case DataSource.NI_INTERNET_CONNECTION:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.NI_INTERNET_CONNECTION);

      default:
        return Failure(ResponseCode.unKnown, ResponseMessage.unknown);
    }
  }
}

class ResponseCode {
  // Api Status code
  static const int sucess = 200;
  static const int noContent = 200;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorised = 401;
  static const int notFound = 404;
  static const int internetErrorServer = 500;

  // local status code
  static const int connectTimeout = -1;
  static const int unKnown = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int senTimeout = -5;
  static const int catchError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  static const String SUCESS = "Sucess";
  static const String noContent = "No Content";
  static const String badRequest = "Bad Request , try again later ";
  static const String forbidden = "for Bidden , try again later";
  static const String unauthorised = "user is unAuthorised , try again later";
  static const String notFound = "url is not found , try again later";
  static const String internetServerError =
      "some thing wrong , try again later";

  // local status code
  static const String connectionTimeout = "time out  , try again later";
  static const String unknown = "some thing wrong , try again later";
  static const String CANCEL = "request was canceled , try again later";
  static const String RECEIVE_TIMEOUT = "time out error , try again later";
  static const String SEND_TIMEOUT = "time out error , try again later";
  static const String CACHERROR = "time out error , try again later";
  static const String NI_INTERNET_CONNECTION =
      "please check your internet connect";
}

class ApiInternalStatus {
  static const int Sucess = 200;
  static const int FAILURE = 1;
}
