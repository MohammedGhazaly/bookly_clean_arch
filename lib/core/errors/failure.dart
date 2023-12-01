import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout with server.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with server.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout with server.");

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate  with server.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(exception.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was canclled.");

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet connection.");

      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "There was an error, please try again.");
    }
  }
  factory ServerFailure.fromResponse(Response<dynamic> response) {
    if (response.statusCode == 404) {
      return ServerFailure(
          errorMessage: "Your request was not found, please try later.");
    } else if (response.statusCode! >= 500) {
      return ServerFailure(
          errorMessage: "There is a problem with server, please try later.");
    } else if (response.statusCode! == 400 ||
        response.statusCode! == 401 ||
        response.statusCode! == 403) {
      return ServerFailure(errorMessage: response.data["error"]["message"]);
    } else {
      return ServerFailure(errorMessage: "There was an error please try again");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}
