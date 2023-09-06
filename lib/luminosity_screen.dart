import 'package:cubit_go_router_challenge/cubit/settings_cubit.dart';
import 'package:cubit_go_router_challenge/cubit/volume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LuminosityScreen extends StatelessWidget {
  const LuminosityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    final settingsCubitState = context.watch<SettingsCubit>().state;
    return settingsCubitState.when(initial: (updateVolumeValue,updateLuminosityValue){
      return Scaffold(
        appBar: AppBar(title: Text("Luminosity Screen"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Luminosity"),
              Text("${(settingsCubitState.luminosityValue * 100).toStringAsFixed(2)}")
            ],
          ),
        ),
      );
    },
    );
  }
}
