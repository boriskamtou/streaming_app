import 'package:local_auth/local_auth.dart';
import 'package:movie_app/src/core/infrastructure/local_storage/local_storage.dart';
import 'package:movie_app/src/core/shared/constants/storage_constants.dart';

class FingerprintConfiguration {
  final LocalAuthentication _localAuthentication;
  final LocalStorage _localStorage;

  FingerprintConfiguration(this._localAuthentication, this._localStorage);

  final List<BiometricType> _biometrics = [];

  List<BiometricType> get listOfBiometricsAvailable => [..._biometrics];

  bool get hasBiometrics =>
      _localStorage.getBool(StorageConstants.hasBiometrics) ?? false;

  Future<void> checkBiometrics() async {
    final hasBiometric = await _localAuthentication.isDeviceSupported();
    _localStorage.saveBool(StorageConstants.hasBiometrics, hasBiometric);
  }

  Future<bool> isAppHasBiometricAuthentication() async {
    final hasBiometricAuthentication =
        await _localAuthentication.canCheckBiometrics;
    return hasBiometricAuthentication;
  }

  Future<void> getBiometricList() async {
    List<BiometricType> biometricTypes =
        await _localAuthentication.getAvailableBiometrics();

    if (biometricTypes.isNotEmpty) {
      for (final biometric in biometricTypes) {
        _biometrics.add(biometric);
      }
    }
  }
}
