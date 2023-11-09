import 'package:animal_hospital/data/data_source/custom_api_service.dart';

class LoginService {
  Future<bool> sendEmail(String userId, String password) async {
    final apiService = ApiService(baseUrl: 'https://dogdr.duckdns.org');
    // print(apiService.baseUrl);

    final requestBody = {"user_id": userId, "password": password};
    print('requestBody: $requestBody');

    try {
      final data = await apiService.customPostAPI('login/', requestBody);
      print('로그인 후 나온 데이터:${data}');
      return true;
    } catch (e) {
      print('로그인에 실패했습니다.: $e');
      return false;
    }
  }
}
