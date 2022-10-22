import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/setup_account/fill_your_profile/infrastructure/fill_profile.dart';

part 'fill_profile_notifier.freezed.dart';

@freezed
class FillProfileState with _$FillProfileState {
  const FillProfileState._();
  const factory FillProfileState.intial() = _Initial;
  const factory FillProfileState.loading() = _Loading;
  const factory FillProfileState.failure([String? message]) = _Failure;
  const factory FillProfileState.success() = _Success;
}

class FillProfileNotifier extends StateNotifier<FillProfileState> {
  final FillProfile _fillProfile;
  FillProfileNotifier(this._fillProfile)
      : super(const FillProfileState.intial());

  Future<void> createProfile(
    File imageUrl,
    String fullName,
    String nickName,
    String email,
    String phoneNumber,
    String gender,
  ) async {
    state = const FillProfileState.loading();
    final failureOrSuccess = await _fillProfile.createProfile(
      imageUrl,
      fullName,
      nickName,
      email,
      phoneNumber,
      gender,
    );
    failureOrSuccess.fold(
      (l) => FillProfileState.failure(l.message),
      (r) => const FillProfileState.success(),
    );
  }
}
