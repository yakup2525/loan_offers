import 'package:dio/dio.dart';
import '/core/core.dart';
import '/product/product.dart';

class DioManager {
  Dio _dio;

  // DioManager'ın singleton instance'ı
  static final DioManager _instance = DioManager._internal();

  static DioManager get instance {
    return _instance;
  }

  DioManager._internal() : _dio = Dio() {
    // Global Dio yapılandırması
    final baseUrl = EnvManager.instance.get(AppConstant.baseUrl);
    _dio
      ..options.baseUrl = baseUrl ?? ''
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> getRequest(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> postRequest(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  AppError _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return AppError(message: "Bağlantı zaman aşımına uğradı.");
    } else if (e.response != null && e.response!.statusCode == 404) {
      return AppError(message: "Kaynak bulunamadı.");
    } else {
      return AppError(message: "Bir hata oluştu: ${e.message}");
    }
  }
}
