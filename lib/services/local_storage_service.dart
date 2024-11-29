import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> savePosts(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('posts', data);
  }

  Future<String?> getPosts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('posts');
  }
}
