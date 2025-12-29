import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

/// Custom exception class for API errors
@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException({
    required String message,
    int? statusCode,
    dynamic data,
  }) = _ApiException;
  
  const ApiException._();

  /// Creates an ApiException from a generic error
  factory ApiException.fromError(dynamic error) {
    if (error is ApiException) return error;
    return ApiException(message: error.toString());
  }

  /// Common API exceptions
  factory ApiException.unauthorized() => 
      const ApiException(message: 'Unauthorized. Please login again.', statusCode: 401);
  
  factory ApiException.forbidden() => 
      const ApiException(message: 'You do not have permission to perform this action.', statusCode: 403);
  
  factory ApiException.notFound() => 
      const ApiException(message: 'Resource not found.', statusCode: 404);
  
  factory ApiException.serverError() => 
      const ApiException(message: 'Server error. Please try again later.', statusCode: 500);
  
  factory ApiException.noConnection() => 
      const ApiException(message: 'No internet connection.', statusCode: 0);
  
  factory ApiException.timeout() => 
      const ApiException(message: 'Request timed out. Please try again.', statusCode: 408);

        @override
        get data => throw UnimplementedError();
      
        @override
        String get message => throw UnimplementedError();
      
        @override
        int? get statusCode => throw UnimplementedError();
}
