import 'package:animal_hospital/data/data_source/custom_api_service.dart';

class EmailVerify {
  Future<void> emailVerify() async {
    final apiService =
        ApiService(baseUrl: 'https://dogdr.duckdns.org/email_verify/');

    try {
      final data = await apiService.customGetAPI('이메일 인증여부');
      print(data);
    } catch (e) {
      print('데이터를 가져오지 못했습니다.: $e');
    }
  }
}
