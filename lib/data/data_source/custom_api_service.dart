import 'dart:convert';
import 'package:http/http.dart' as http;

import 'get_token/get_csrf_token.dart';

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

  Future<Map<String, dynamic>> customPostAPI(
      String endpoint, Map<String, dynamic> payload) async {
    // 토큰값 추출
    if (csrfToken == null) {
      await fetchCSRFToken();
    }

    if (csrfToken == null) {
      throw Exception('CSRF 토큰 값이 없습니다.');
    }

    final headers = {
      'Content-Type': 'application/json',
      'X-CSRFToken': csrfToken!, // X-CSRFToken 헤더에 csrfToken 값을 추가
    };

    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(payload),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('(POST) 서버와의 연결 실패${utf8.decode(response.bodyBytes)}');
    }
  }
}
