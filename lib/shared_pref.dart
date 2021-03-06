import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPref {
  late final SharedPreferences _preferences;
  final _accessToken = 'accessToken';
  final _refreshToken = 'refreshToken';
  final _username = 'username';
  final _expireAt = 'expire_at';
  Future init() async => _preferences = await SharedPreferences.getInstance();
  set expireAt(int? value) {
    _preferences.setInt(_expireAt, value!);
  }

  int? get expireAt => _preferences.getInt(_expireAt);
  set token(String? value) {
    _preferences.setString(_accessToken, value!);
  }

  String? get token => _preferences.getString(_accessToken);

  set refreshToken(String? value) {
    _preferences.setString(_refreshToken, value!);
  }

  String? get refreshToken => _preferences.getString(_refreshToken);

  set username(String? value) {
    _preferences.setString(_username, value!);
  }

  String? get username => _preferences.getString(_username);

  Future clear() async => await _preferences.clear();
}
