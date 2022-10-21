import 'dart:convert';
import 'dart:typed_data';

import 'package:movie_app/src/core/infrastructure/local_storage/shared_prefs_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements SharedPrefsStorage {
  final SharedPreferences _prefs;

  LocalStorage(this._prefs);
  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  Future<Uint8List?> getImage(String key) async {
    final base64Image = _prefs.getString(key);
    if (base64Image != null) return const Base64Decoder().convert(base64Image);
    return null;
  }

  @override
  Map<String, dynamic>? getObject(String key) {
    final objectString = _prefs.getString(key);
    if (objectString != null) {
      return const JsonDecoder().convert(objectString) as Map<String, dynamic>;
    }
    return null;
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<bool> removeBool(String key) async {
    return await _prefs.remove(key);
  }

  @override
  Future<void> removeImage(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> removeObject(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> removeString(String key) async {
    await _prefs.remove(key);
  }

  @override
  void saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  void saveImage(String key, Uint8List image) async {
    final base64Image = const Base64Encoder().convert(image);
    await _prefs.setString(key, base64Image);
  }

  @override
  void saveObject(String key, Map<String, dynamic> object) async {
    final string = const JsonEncoder().convert(object);
    await _prefs.setString(key, string);
  }

  @override
  void saveString(String key, String value) async {
    _prefs.setString(key, value);
  }
}
