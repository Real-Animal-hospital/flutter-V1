import 'dart:convert';

import 'package:animal_hospital/domain/model/signup_user/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const baseURL = 'https://34.168.248.106';

  Future<User> getUser() async {
    final response = await http.get(Uri.parse('$baseURL/user/'));

    return User.fromJson(jsonDecode(response.body));
  }
}
