import 'package:bookly_clean_arch/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response<dynamic>> get({required String endPoint}) async {
    var response = await dio.get("${ApiConstants.baseUrl}$endPoint");

    return response;
  }
}
