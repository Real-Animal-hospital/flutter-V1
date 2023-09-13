import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    required String number,
    required String password,
    required int is_email_verified,

  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
