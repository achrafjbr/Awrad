import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// For caching data locally i'll depend on sharedPreferences.
class UserCache {
  static Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  /// set [UserId] into Cache.
  static Future<void> setCacheUserId({required String userId}) async {
    final prefs = await getSharedPrefs();
    await prefs.setString('userId', userId);
  }

  /// get [UserId] from Cache
  static Future<String?> getCacheUserId() async {
    final prefs = await getSharedPrefs();
    return prefs.getString('userId');
  }



  /// Set cache preferences of the user.
  static Future<void> setCacheUserPreferences({
    required Map<String,dynamic> userPreferences,
  }) async {
    final prefs = await getSharedPrefs();
    final String jsonString = jsonEncode(userPreferences); // Convert to JSON
    await prefs.setString('preferences', jsonString);
  }

  /// Get cache preferences of the user.
  static Future<Map<String,dynamic>?> getCacheUserPreferences() async {
    final prefs = await getSharedPrefs();
    final String? jsonString = prefs.getString('preferences');
    if (jsonString != null) {
      // Convert back from JSON
      return  jsonDecode(jsonString);
    } else {
      return null;
    }
  }

  /// Clear the user Id from the cache.
  static Future<void> clearCacheUserId() async {
    final prefs = await getSharedPrefs();
    prefs.remove('userId');
  }

  /// Clear the user data from the cache.
  static Future<void> clearCacheUser() async {
    final prefs = await getSharedPrefs();
    prefs.remove('user');
  }

  /// Clear preferences user  from the cache.
  static Future<void> clearCacheUserPreferences() async {
    final prefs = await getSharedPrefs();
    prefs.remove('preferences');
  }

}
