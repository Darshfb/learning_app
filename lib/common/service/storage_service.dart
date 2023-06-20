import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _sharedPreferences;

  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  getBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    }
    return await _sharedPreferences.setDouble(key, value);
  }

  Future<bool> clearData(String? key) async {
    return await _sharedPreferences.remove(key!);
  }

  Future<bool> clearAll() async {
    return await _sharedPreferences.clear();
  }
}
