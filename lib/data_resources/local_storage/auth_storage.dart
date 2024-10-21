import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {

  late final SharedPreferences prefs;
  late final Box box;

  AuthStorage(this.prefs, this.box);

  Future<void> setToken(String token) async {
    box.put('token', token);
    prefs.setString('token', token);
  }

  Future<void> removeToken() async {
    box.delete('token');
    prefs.remove('token');
  }

  String? get token {
    return box.get('token');
    return prefs.getString('token');
  }

}