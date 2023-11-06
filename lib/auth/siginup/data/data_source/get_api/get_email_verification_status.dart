import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getCsrfToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('csrfToken') ?? '';
}

Future<void> updateCsrfToken(String newToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('csrfToken', newToken);
}

Future<bool> getEmailVerificationStatus(String userId) async {
  final url = Uri.parse('https://dogdr.duckdns.org/email_verify/');
  final csrfToken = await getCsrfToken();

  try {
    final response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'X-CSRFToken': csrfToken,
      },
    );

    if (response.statusCode == 200) {
      // JSON 응답을 파싱하여 사용자 목록을 가져옴
      List<dynamic> users = json.decode(response.body);

      // 'users' 배열에서 'user_id'가 일치하는 사용자를 찾음
      var user = users.firstWhere(
        (u) => u['user_id'] == userId,
        orElse: () => null,
      );

      if (user != null && user['is_email_verified'] == 1) {
        // 이메일이 인증된 경우 true를 반환
        return true;
      } else {
        // 이메일 인증이 되지 않았거나 유저를 찾을 수 없는 경우 false를 반환
        return false;
      }
    } else {
      // 서버 에러가 발생한 경우
      print('Server error: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    // 네트워크 예외가 발생했을 때
    print('Error sending request: $e');
    return false;
  }
}
