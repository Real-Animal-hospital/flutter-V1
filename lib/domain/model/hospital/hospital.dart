import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hospital.freezed.dart';

part 'hospital.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey(name: 'hospital_id') required int hospitalId,
    @JsonKey(name: 'station_name') required String stationName,
    @JsonKey(name: 'hospital_name') required String hospitalName,
    @JsonKey(name: 'business_hours') required String businessHours,
    @JsonKey(name: 'day_off') required String dayOff,
    required String address,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String lunchtime,
    required double lat,
    required double lan,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, Object?> json) =>
      _$HospitalFromJson(json);
}
