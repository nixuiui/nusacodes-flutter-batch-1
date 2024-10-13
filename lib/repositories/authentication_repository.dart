import 'package:flutter_nusacodes/models/user_model.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {

  final network = NetworkService();

  Future<User> login(String email, String password) async {
    final response = await network.post(
      url: "/api/auth/login",
      data: {
        "email": email,
        "password": password
      }
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', response.data['data']['access_token']);
    
    return User.fromJson(response.data['data']['user']);
  }
}