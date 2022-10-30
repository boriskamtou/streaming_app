import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../infrastructure/local_storage/local_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final sharedPreferenceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefProvider = Provider<LocalStorage>((ref) {
  return LocalStorage(ref.watch(sharedPreferenceProvider));
});

final localAuthenticationProvider = Provider<LocalAuthentication>((ref) {
  return LocalAuthentication();
});
