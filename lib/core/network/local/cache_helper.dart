import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPref;

  static Future<SharedPreferences> init() async {
    return _sharedPref = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    return _sharedPref.get(key);
  }

  static Future<bool> deleteData(String key) async {
    return await _sharedPref.remove(key);
  }

  static Future<bool> saveData(String key, dynamic value) async {
    if (value is bool) return await _sharedPref.setBool(key, value);
    if (value is double) return await _sharedPref.setDouble(key, value);
    if (value is int) return await _sharedPref.setInt(key, value);
    return await _sharedPref.setString(key, value);
  }
}
