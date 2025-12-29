import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A functional result type for handling success and error states
/// Similar to Either in fp-dart but simplified for our use case
@freezed
sealed class Result<T> with _$Result<T> {
  /// Successful result containing data
  const factory Result.success(T data) = Success<T>;
  
  /// Error result containing an exception
  const factory Result.error(Exception exception) = Error<T>;
  
  const Result._();

  /// Returns true if this is a successful result
  bool get isSuccess => this is Success<T>;
  
  /// Returns true if this is an error result
  bool get isError => this is Error<T>;
  
  /// Gets the data if successful, null otherwise
  T? get dataOrNull => maybeWhen(
    success: (data) => data,
    orElse: () => null,
  );
  
  /// Gets the exception if error, null otherwise
  Exception? get exceptionOrNull => maybeWhen(
    error: (exception) => exception,
    orElse: () => null,
  );
  
  /// Maps the data to a new type if successful
  Result<R> mapData<R>(R Function(T data) mapper) {
    return maybeWhen(
      success: (data) => Result.success(mapper(data)),
      orElse: () => Result.error(exceptionOrNull ?? Exception('Unknown error')),
    );
  }
  
  /// Folds the result to a single value
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Exception exception) onError,
  }) {
    return when(
      success: onSuccess,
      error: onError,
    );
  }
}
