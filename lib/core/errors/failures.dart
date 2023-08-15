import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error, try again');
      default:
        return ServerFailure('Ops There was an error, please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There was an error from server, please try again later');
    } else {
      return ServerFailure('Ops There was an error, please try again later');
    }
  }
}
