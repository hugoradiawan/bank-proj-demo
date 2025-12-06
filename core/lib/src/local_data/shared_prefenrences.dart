import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:core/src/interfaces/local_data_repository.dart'
    show LocalDataRepository;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class SharedPreferencesService implements LocalDataRepository {
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._();
  late SharedPreferences _sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._();

  SharedPreferences get prefs => _sharedPreferences;

  @override
  Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  @override
  Future<void> saveJson(String key, Map<String, dynamic> value) async {
    await _sharedPreferences.setString(key, jsonEncode(value));
  }

  @override
  Map<String, dynamic>? getJson(String key) {
    final String? jsonString = _sharedPreferences.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  @override
  Future<void> clear() => _sharedPreferences.clear();

  @override
  Future<void> saveJsonList(
    String key,
    List<Map<String, dynamic>> value,
  ) async {
    final String jsonString = jsonEncode(value);
    await _sharedPreferences.setString(key, jsonString);
  }

  @override
  List<Map<String, dynamic>>? getJsonList(String key) {
    final String? jsonString = _sharedPreferences.getString(key);
    if (jsonString == null) return null;
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList.map((dynamic e) => e as Map<String, dynamic>).toList();
  }
}
