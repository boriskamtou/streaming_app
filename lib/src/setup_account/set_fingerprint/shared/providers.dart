import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/core/shared/providers.dart';
import 'package:movie_app/src/setup_account/set_fingerprint/infrastructure/fingerprint_configuration.dart';

final fingerprintConfigurationProvider =
    Provider<FingerprintConfiguration>((ref) {
  return FingerprintConfiguration(
    ref.watch(localAuthenticationProvider),
    ref.watch(sharedPrefProvider),
  );
});
