import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/models/user_model.dart';
import '../constant/app_constants.dart';

class AuthService {
  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<bool> login(String email, String password) async {
    // Implement login logic here
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Save token
      await _prefs.setString(AppConstants.tokenKey, 'dummy_token');
      
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String email, String password, String name) async {
    // Implement registration logic here
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await _prefs.clear();
  }

  bool isLoggedIn() {
    return _prefs.getString(AppConstants.tokenKey) != null;
  }
}