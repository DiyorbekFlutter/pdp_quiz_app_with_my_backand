import "package:shared_preferences/shared_preferences.dart";

enum StorageKey {
  uid,
  user,
  isActive,
  token,
  theme,
}

sealed class AppStorage {
  static Future<void> store({required StorageKey key, required String value}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(key.name, value);
  }

  static Future<String?> load(StorageKey key) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(key.name);
  }

  static Future<void> delete({required StorageKey key}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(key.name);
  }
}
