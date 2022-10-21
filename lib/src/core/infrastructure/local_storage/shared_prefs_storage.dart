import 'package:flutter/services.dart';

abstract class SharedPrefsStorage {
  void saveBool(String key, bool value);
  bool? getBool(String key);
  Future<bool> removeBool(String key);

  void saveString(String key, String value);
  String? getString(String key);
  Future<void> removeString(String key);

  void saveImage(String key, Uint8List image);
  Future<Uint8List?> getImage(String key);
  Future<void> removeImage(String key);

  Map<String, dynamic>? getObject(String key);
  void saveObject(String key, Map<String, dynamic> object);
  Future<void> removeObject(String key);
}
