import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();
  static Prefs instance = Prefs._();

  static Future<bool> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user_id', userId);
  }

   Future<String> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_id').toString();
    return token;
  }

   static Future<bool> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(
      'user_id',
    );
  }
}
