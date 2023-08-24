import 'dart:convert';

import 'package:animal_hospital/domain/model/user/user.dart';

import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => User.fromJson(e)).toList();
  }
}
