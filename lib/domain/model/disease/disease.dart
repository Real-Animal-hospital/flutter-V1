import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'disease.freezed.dart';

part 'disease.g.dart';

@freezed
class Disease with _$Disease {
  const factory Disease({
    @JsonKey(name: 'diseases_id') required int diseasesId,
    required String name,
  }) = _Disease;

  factory Disease.fromJson(Map<String, Object?> json) =>
      _$DiseaseFromJson(json);
}
