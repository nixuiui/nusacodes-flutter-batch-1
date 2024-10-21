import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {

  late final SharedPreferences prefs;

  AuthStorage(this.prefs);

  Future<void> setToken(String token) async {
    prefs.setString('token', token);
  }

  Future<void> removeToken() async {
    prefs.remove('token');
  }

  String? get token => prefs.getString('token');

}