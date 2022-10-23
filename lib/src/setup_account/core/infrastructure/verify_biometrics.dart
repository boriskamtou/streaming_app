import 'package:local_auth/local_auth.dart';

class VerifyBiometrics {
  final LocalAuthentication _localAuthentication;

  VerifyBiometrics(this._localAuthentication);

  final List<BiometricType> _biometrics = [];

  List<BiometricType> get listOfBiometricsAvailable => [..._biometrics];

  Future<bool> verifyBiometrics() async {
    final hasBiometric = await _localAuthentication.isDeviceSupported();
    return hasBiometric;
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
