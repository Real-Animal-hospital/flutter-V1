import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:animal_hospital/domain/model/login/login_request.dart';

class LoginApi {
  static const baseURL = 'https://34.168.248.106/swagger/?format=openapi';

  Future<LoginRequest> getLogin() async {
    final response = await http
        .get(Uri.parse('$baseURL#/definitions/LoginRequestLoginRequest'));

    return LoginRequest.fromJson(jsonDecode(response.body));
  }
}
