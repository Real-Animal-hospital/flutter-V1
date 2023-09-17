import 'package:dio/dio.dart';

final dio = Dio();
String? csrfToken;

Future<void> fetchCSRFToken() async {
  final response = await dio
      .get('https://dogdr.duckdns.org/swagger'); // 여기에 초기화 또는 로그인 엔드포인트를 사용하세요.

  if (response.headers.map.containsKey('set-cookie')) {
    List<String>? cookies = response.headers.map['set-cookie'];
    if (cookies != null && cookies.isNotEmpty) {
      String rawCookie = cookies.first;
      print('Raw Cookie Value: $rawCookie'); // 전체 쿠키 값을 출력합니다.

      int index = rawCookie.indexOf('csrftoken=');
      if (index != -1) {
        csrfToken = rawCookie.substring(
            index + 'csrftoken='.length, rawCookie.indexOf(';', index));
        print('토큰 값: $csrfToken'); // 추출된 csrftoken 값을 출력합니다.
      } else {
        print('CSRFTOKEN가 쿠키에 없습니다.'); // csrftoken이 쿠키에서 발견되지 않았을 경우 출력
      }
    } else {
      print('서버에서 쿠키를 보내지 않았습니다.'); // 서버에서 쿠키가 반환되지 않았을 경우 출력
    }
  } else {
    print('set-cookie가 응답에 없습니다.'); // 응답에서 set-cookie 헤더가 없는 경우 출력
  }
}
