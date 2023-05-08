import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
  Future<bool> checkLogin() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isLogined = sharedPreferences.getBool('islogined') ?? false;
    return isLogined;
  }
}
