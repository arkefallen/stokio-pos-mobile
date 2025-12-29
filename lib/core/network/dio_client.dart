import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// Singleton Dio client with configured interceptors
class DioClient {
  late final Dio _dio;
  
  Dio get dio => _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConfig.connectTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConfig.receiveTimeout),
        sendTimeout: const Duration(milliseconds: ApiConfig.sendTimeout),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors in order of execution
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptor(),
    ]);
  }
}

/// Provider for the DioClient instance
/// This creates a singleton instance that can be used throughout the app
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

/// Convenience provider to get the Dio instance directly
final dioProvider = Provider<Dio>((ref) {
  return ref.watch(dioClientProvider).dio;
});
