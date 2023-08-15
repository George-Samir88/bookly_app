import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'https://www.googleapis.com/books/';
  final Dio _dio;

  DioHelper(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
