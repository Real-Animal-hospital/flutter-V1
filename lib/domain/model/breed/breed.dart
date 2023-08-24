import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'breed.freezed.dart';

part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const factory Breed({
    @JsonKey(name: 'breed_name') required String breedName,
    @JsonKey(name: 'general_care') required String generalCare,
  }) = _Breed;

  factory Breed.fromJson(Map<String, Object?> json) => _$BreedFromJson(json);
}
