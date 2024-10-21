import 'package:flutter_nusacodes/data_resources/local_storage/auth_storage.dart';
import 'package:flutter_nusacodes/models/user_model.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';

class AuthenticationRepository {

  late final NetworkService network;
  late final AuthStorage authStorage;

  AuthenticationRepository(this.network, this.authStorage);

  Future<User> login(String email, String password) async {
    final response = await network.post(
      url: "/api/auth/login",
      data: {
        "email": email,
        "password": password
      }
    );

    await authStorage.setToken(response.data['data']['access_token']);
    
    return User.fromJson(response.data['data']['user']);
  }
}