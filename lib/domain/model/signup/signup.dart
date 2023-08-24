import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'signup.freezed.dart';

part 'signup.g.dart';

@freezed
class Signup with _$Signup {
  const factory Signup({
    required String userId,
    required String password,
    required String name,
    required String number,
  }) = _Signup;

  factory Signup.fromJson(Map<String, Object?> json) => _$SignupFromJson(json);
}
