import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/core/application/app_router_notifier.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../infrastructure/local_storage/local_storage.dart';
import '../infrastructure/local_storage/shared_prefs_storage.dart';

final sharedPreferenceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefProvider = Provider<SharedPrefsStorage>((ref) {
  return LocalStorage(ref.watch(sharedPreferenceProvider));
});

final appRouterNotifier = ChangeNotifierProvider<AppRouteNotifier>((ref) {
  return AppRouteNotifier(ref);
});

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(ref.watch(appRouterNotifier));
});
