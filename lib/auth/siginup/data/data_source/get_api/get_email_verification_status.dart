import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> getEmailVerificationStatus(String userId) async {
  final url = Uri.parse('https://dogdr.duckdns.org/email_verify/');

  try {
    final response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'X-CSRFToken':
            'JJdwkMabcOCsQhF2SFeWM3UupZ7ZzoP1Cjfu7hti3o6HWz2pQG7nGDGXXItDN6sD',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> users = json.decode(response.body);

      var user = users.firstWhere(
        (u) => u["user_id"] == userId,
        orElse: () => null,
      );

      if (user != null && user["is_email_verified"] == 1) {
        // 이메일이 인증된 경우
        return true;
      } else {
        // 이메일 인증이 되지 않았거나 유저를 찾을 수 없는 경우
        return false;
      }
    } else {
      // 서버에서 에러가 발생한 경우
      print('Server error: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error sending request: $e');
    return false;
  }
}
