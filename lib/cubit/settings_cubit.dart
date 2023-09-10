import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial(0, 0)) {
    // Load the saved state when the cubit is created
    loadStateFromSharedPreferences();
  }

  void updateVolumeValue(double value) {
    emit(state.copyWith(volumeValue: value));
    saveStateToSharedPreferences(); // Save the updated state
  }

  void updateLuminosityValue(double value) {
    emit(state.copyWith(luminosityValue: value));
    saveStateToSharedPreferences(); // Save the updated state
  }

  // Save the current state to SharedPreferences
  void saveStateToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('volumeValue', state.volumeValue);
    await prefs.setDouble('luminosityValue', state.luminosityValue);
  }

  // Load the state from SharedPreferences and emit a new state
  Future<void> loadStateFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final volumeValue = prefs.getDouble('volumeValue') ?? 0;
    final luminosityValue = prefs.getDouble('luminosityValue') ?? 0;
    emit(SettingsState.initial(volumeValue, luminosityValue));
  }

}
