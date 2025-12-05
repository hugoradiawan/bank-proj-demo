abstract class LocalDataRepository {
  Future<void> init();

  Future<void> saveJson(String key, Map<String, dynamic> value);

  Future<void> saveJsonList(String key, List<Map<String, dynamic>> value);

  Map<String, dynamic>? getJson(String key);

  List<Map<String, dynamic>>? getJsonList(String key);

  Future<void> clear();
}
