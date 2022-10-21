import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../infrastructure/local_storage/local_storage.dart';
import '../infrastructure/local_storage/shared_prefs_storage.dart';

final sharedPreferenceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefProvider = Provider<SharedPrefsStorage>((ref) {
  return LocalStorage(ref.watch(sharedPreferenceProvider));
});
