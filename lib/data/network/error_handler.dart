import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error response of the API or from dio itself
      failure = _handleError(error);
    } else {
      //default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECTION_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RESIEVE_TIMEOUT.getFailure();
    case DioErrorType.badCertificate:
      return DataSource.UNAUTHORISED.getFailure();
    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? '');
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioErrorType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  CANCEL,
  RESIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponceCode.SUCCESS, ResponceMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponceCode.NO_CONTENT, ResponceMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponceCode.BAD_REQUEST, ResponceMessage.BAD_REQUEST);

      case DataSource.UNAUTHORISED:
        return Failure(ResponceCode.UNAUTHORISED, ResponceMessage.UNAUTHORISED);

      case DataSource.FORBIDDEN:
        return Failure(ResponceCode.FORBIDDEN, ResponceMessage.FORBIDDEN);

      case DataSource.NOT_FOUND:
        return Failure(ResponceCode.NOT_FOUND, ResponceMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponceCode.INTERNAL_SERVER_ERROR,
            ResponceMessage.INTERNAL_SERVER_ERROR);

      case DataSource.CONNECTION_TIMEOUT:
        return Failure(ResponceCode.CONNECTION_TIMEOUT,
            ResponceMessage.CONNECTION_TIMEOUT);

      case DataSource.CANCEL:
        return Failure(ResponceCode.CANCEL, ResponceMessage.CANCEL);

      case DataSource.RESIEVE_TIMEOUT:
        return Failure(
            ResponceCode.RESIEVE_TIMEOUT, ResponceMessage.RESIEVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponceCode.SEND_TIMEOUT, ResponceMessage.SEND_TIMEOUT);

      case DataSource.CACHE_ERROR:
        return Failure(ResponceCode.CACHE_ERROR, ResponceMessage.CACHE_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponceCode.NO_INTERNET_CONNECTION,
            ResponceMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponceCode.DEFAULT, ResponceMessage.DEFAULT);
    }
  }
}

class ResponceCode {
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, api rejected request
  static const int UNAUTHORISED = 401; // failure, user not authorised
  static const int FORBIDDEN = 403; // failure, api rejected request
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500; //failure, crash in server side

  // local status code
  static const int CONNECTION_TIMEOUT = -1;
  static const int CANCEL = -1;
  static const int RESIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponceMessage {
  static String SUCCESS = AppStrings.success.tr(); //success with data
  static String NO_CONTENT =
      AppStrings.noContent.tr(); //success with no data (no content)
  static String BAD_REQUEST =
      AppStrings.badRequestError.tr(); // failure, api rejected request
  static String UNAUTHORISED =
      AppStrings.unauthorizedError.tr(); // failure, user not authorised
  static String FORBIDDEN =
      AppStrings.forbiddenError.tr(); // failure, api rejected request
  static String NOT_FOUND = AppStrings.notFoundError.tr();
  static String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError.tr(); //failure, crash in server side

  // local status code
  static String CONNECTION_TIMEOUT = AppStrings.timeoutError.tr();
  static String CANCEL = AppStrings.defaultError.tr();
  static String RESIEVE_TIMEOUT = AppStrings.timeoutError.tr();
  static String SEND_TIMEOUT = AppStrings.timeoutError.tr();
  static String CACHE_ERROR = AppStrings.cacheError.tr();
  static String NO_INTERNET_CONNECTION = AppStrings.noInternetError.tr();
  static String DEFAULT = AppStrings.defaultError.tr();
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
