import 'package:project/core/services/local_storage_service.dart';
import 'package:dio/dio.dart';

class DioClient {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  final Dio _dio;
  final LocalStorageService _localStorageService;

  DioClient({LocalStorageService? localStorage})
      : _localStorageService = localStorage ?? LocalStorageService(),
        _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'}
      ),
    ) {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          // automatically add token to headers if available from SharedPreferences
          final token = await _localStorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException error, handler) {
          handler.next(error);
        },
      )
    );
  }

  Dio get dio => _dio;
}