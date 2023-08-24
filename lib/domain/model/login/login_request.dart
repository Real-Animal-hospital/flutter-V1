import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_request.freezed.dart';

part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'user_id') required String userId,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, Object?> json) =>
      _$LoginRequestFromJson(json);
}
