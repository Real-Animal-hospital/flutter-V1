import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  // Custom GET API 호출
  Future<Map<String, dynamic>> customGetAPI(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('(GET) 서버와의 연결 실패');
    }
  }

  // Custom POST API 호출
  Future<Map<String, dynamic>> customPostAPI(
      String endpoint, Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('(POST) 서버와의 연결 실패');
    }
  }
}
