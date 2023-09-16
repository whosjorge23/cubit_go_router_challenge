import 'package:cubit_go_router_challenge/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    final settingsCubitState = context.watch<SettingsCubit>().state;
    return settingsCubitState.when(initial: (updateVolumeValue,updateLuminosityValue,){
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Volume"),
              Slider(
                    value: settingsCubitState.volumeValue,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      context.read<SettingsCubit>().updateVolumeValue(value);
                    },
                  ),
              Text("Luminosity"),
              Slider(
                value: settingsCubitState.luminosityValue,
                min: 0.0,
                max: 1.0,
                onChanged: (value) {
                  context.read<SettingsCubit>().updateLuminosityValue(value);
                },
              ),
            ],
          ),
        ),
      );
    });



  }
}

