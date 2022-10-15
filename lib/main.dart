import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/core/presentation/app_widget.dart';
import 'package:movie_app/src/core/shared/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerProvider extends ProviderObserver {
  var log = Logger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is StateController<int>) {
      log.i(
          '[${provider.name ?? provider.runtimeType}] value: ${newValue.state}');
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      observers: [LoggerProvider()],
      overrides: [
        sharedPreferenceProvider.overrideWithValue(_prefs),
      ],
      child: const AppWidget(),
    ),
  );
}
