import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'https://www.googleapis.com/books/';
  final Dio dio;

  DioHelper(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
