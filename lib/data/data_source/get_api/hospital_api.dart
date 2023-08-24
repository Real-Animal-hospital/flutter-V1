import 'dart:convert';

import 'package:animal_hospital/domain/model/hospital/hospital.dart';
import 'package:http/http.dart' as http;

class HospitalApi {
  static const baseURL = 'https://34.168.248.106';

  Future<List<Hospital>> getHospitals() async {
    final response = await http.get(Uri.parse('$baseURL/hospital/'));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => Hospital.fromJson(e)).toList();
  }
}
