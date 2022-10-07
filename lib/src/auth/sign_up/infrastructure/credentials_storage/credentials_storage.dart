abstract class CredentialsStorage<T> {
  Future<T?> getCredentials();
  Future<void> saveCredentials(T credentials);
  Future<void> clearCredentials();
}
