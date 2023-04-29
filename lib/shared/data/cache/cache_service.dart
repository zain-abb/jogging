import 'dart:collection';

import 'package:jogging/app/extensions.dart';
import 'package:jogging/shared/domain/providers/external_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_service.g.dart';

@riverpod
class CacheService extends _$CacheService {
  final HashMap<String, dynamic> _data = HashMap();

  @override
  void build() {
    return;
  }

  void clear() {
    _data.clear();
  }

  void put(String key, dynamic value, {bool persist = false}) {
    assert(value != null);

    // Store value in cache
    _data[key] = value;

    // Save value in preferences if memoryOnly is false
    if (persist) {
      final prefs = ref.read(sharedPreferencesProvider);
      if (value is bool) {
        prefs.setBool(key, value);
      } else if (value is int) {
        prefs.setInt(key, value);
      } else if (value is double) {
        prefs.setDouble(key, value);
      } else if (value is String) {
        prefs.setString(key, value);
      } else {
        prefs.setObject(key, value);
      }
    }
  }

  Future<dynamic> get(String key) async {
    // Get value from cache
    dynamic value = _data[key];

    if (value == null) {
      // If value is not found in cache, get it from preferences
      final prefs = ref.read(sharedPreferencesProvider);
      try {
        value = prefs.get(key);
      } catch (e) {
        value = await prefs.getObject(key);
      }
    }
    return value;
  }

  void remove(String key) async {
    // Remove value from cache
    _data.remove(key);

    // Remove value from preferences
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(key);
  }
}
