import 'dart:convert';

import 'package:animal_hospital/domain/model/breed/breed.dart';
import 'package:http/http.dart' as http;

class BreedsApi {
  static const baseURL = 'https://34.168.248.106';

  Future<List<Breed>> getBreeds() async {
    final response = await http.get(Uri.parse('$baseURL/breeds/'));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => Breed.fromJson(e)).toList();
  }
}
