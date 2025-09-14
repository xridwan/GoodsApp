import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  final SharedPreferences _preferences;

  AppState(this._preferences);

  Future<void> saveToken(String token) async {
    await _preferences.setString('access_token', token);
  }

  Future<String?> getToken() async => _preferences.getString('access_token');

  Future<void> clearToken() async {
    await _preferences.remove('access_token');
  }
}
