import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_up.freezed.dart';

part 'sign_up.g.dart';

@freezed
class SignUp with _$SignUp {
  const factory SignUp({
    required String userId,
    required String password,
    required String name,
    required String number,
  }) = _SignUp;

  factory SignUp.fromJson(Map<String, Object?> json) => _$SignUpFromJson(json);
}
