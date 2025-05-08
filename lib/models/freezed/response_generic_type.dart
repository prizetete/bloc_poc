import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_generic_type.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T data) = Success<T>;
  const factory ApiResponse.error(String message) = Error<T>;
}
