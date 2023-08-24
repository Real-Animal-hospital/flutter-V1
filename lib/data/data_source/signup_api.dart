import 'dart:convert';

import 'package:animal_hospital/domain/model/signup/signup.dart';
import 'package:http/http.dart' as http;

class SignupApi {
  static const baseURL = 'https://34.168.248.106';

  Future<Signup> getSignup() async {
    final response = await http.get(Uri.parse('$baseURL/signup'));

    return Signup.fromJson(jsonDecode(response.body));
  }
}
