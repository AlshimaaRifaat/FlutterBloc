import 'package:dio/dio.dart';
import 'package:flutter_bloc_sample/app_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getCategoriesList({required String endPoint}) async {
    var response = await _dio.get('${AppConstants.baseUrl}$endPoint');
    return response.data;
  }
}
