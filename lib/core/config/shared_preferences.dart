import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  // Initialize shared preferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save string data
  static Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  // Get string data
  static String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  // Save bool data
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  // Get bool data
  static bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  // Save int data
  static Future<bool> setInt(String key, int value) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  // Get int data
  static int getInt(String key) {
    return _prefs?.getInt(key) ?? 0;
  }

  // Remove data
  static Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  // Clear all data
  static Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}