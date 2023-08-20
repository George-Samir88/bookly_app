import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure({required this.error});
}

class ServerFailure extends Failure {
  ServerFailure({required super.error});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(error: 'Connection Time out with Api Service');
      case DioExceptionType.sendTimeout:
        return ServerFailure(error: 'Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(error: 'Receive time out with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(error: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(
            error: 'There was connection error, may be no internet');
      case DioExceptionType.unknown:
        return ServerFailure.fromNoInternetConnection(dioException.error.toString());
      default:
        return ServerFailure(
            error: 'Ops There was an error, please try again later');
    }
  }

  factory ServerFailure.fromNoInternetConnection(String errorMessage) {
    if (errorMessage.contains('SocketException:')) {
      return ServerFailure(error: 'No Internet Connection');
    } else {
      return ServerFailure(error: 'Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(error: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          error: 'Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          error: 'There was an error from server, please try again later');
    } else {
      return ServerFailure(
          error: 'Ops There was an error, please try again later');
    }
  }
}
