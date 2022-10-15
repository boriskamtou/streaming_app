import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/credentials_storage/credentials_storage.dart';

class SecureCredentialsStorage implements CredentialsStorage {
  final FlutterSecureStorage _storage;

  SecureCredentialsStorage(this._storage);

  @override
  Future<void> clearCredentials() async {
    await _storage.deleteAll();
  }

  @override
  Future<String?> getCredentials(String key) async {
    final credentials = await _storage.read(key: key);
    return credentials;
  }

  @override
  Future<void> saveCredentials(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }
}
