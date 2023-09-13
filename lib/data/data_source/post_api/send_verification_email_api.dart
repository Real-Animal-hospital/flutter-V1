import 'package:animal_hospital/data/data_source/custom_api_service.dart';

class SendVerificationEmail {
  Future<void> sendEmail(String email, {String? password}) async {
    final apiService = ApiService(
        baseUrl: 'https://dogdr.duckdns.org/send_verification_email/');

    final payload = {
      "email": "string",
      if (password != null) "password": password,
    };
    try {
      final data = await apiService.customPostAPI('인증을 보냈습니다.', payload);
      print(data);
    } catch (e) {
      print('데이터를 가져오지 못했씁니다.: $e');
    }
  }
}
