import 'package:dio/dio.dart';

class ApiManager {
  static const showPath = '/shows';

  static const homePath = '/?q=all';

  static const searchPath = '/search/$showPath';
}

class ApiService {
  ApiService(this._dio);

  final Dio _dio;
  final baseUrl = 'https://api.tvmaze.com';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
