part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial(
      double volumeValue,
      double luminosityValue,
      ) = _Initial;

}
