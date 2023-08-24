import 'dart:convert';

import 'package:animal_hospital/domain/model/disease/disease.dart';
import 'package:http/http.dart' as http;

class DiseasesApi {
  static const baseURL = 'https://34.168.248.106';

  Future<List<Disease>> getDiseases() async {
    final response = await http.get(Uri.parse('$baseURL/diseases/'));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => Disease.fromJson(e)).toList();
  }
}
