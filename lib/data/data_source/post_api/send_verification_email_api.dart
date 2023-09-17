import 'dart:convert';

import 'package:animal_hospital/data/data_source/custom_api_service.dart';

class SendVerificationEmail {
  Future<void> sendEmail(String email, String password) async {
    final apiService = ApiService(baseUrl: 'https://dogdr.duckdns.org');
    // print(apiService.baseUrl);

    final requestBody = {"user_id": email, "password": password};
    print('requestBody: $requestBody');

    try {
      final data = await apiService.customPostAPI(
          'send_verification_email/', requestBody);
      print('텍스트컨트롤러에서 나온 데이터:${data}');
    } catch (e) {
      print('데이터를 가져오지 못했씁니다.: $e');
    }
  }
}
