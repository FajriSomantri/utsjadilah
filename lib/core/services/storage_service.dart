import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<bool> saveString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> saveObject(String key, Map<String, dynamic> value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Map<String, dynamic>? getObject(String key) {
    final data = _prefs.getString(key);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }
}