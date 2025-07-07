import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalRepository {
  final auth = FirebaseAuth.instance;

  Future<void> saveUserId(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', value);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> removeUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');
    } catch (e) {
      print('User id ochirishda xatolik: $e');
    }
  }
}
