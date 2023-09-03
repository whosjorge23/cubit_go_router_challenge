import 'package:cubit_go_router_challenge/cubit/settings_cubit.dart';
import 'package:cubit_go_router_challenge/cubit/volume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeScreen extends StatelessWidget {
  const VolumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    final settingsCubitState = context.watch<SettingsCubit>().state;
    return settingsCubitState.when(initial: (updateVolumeValue){
        return Scaffold(
          appBar: AppBar(title: Text("Volume Screen"),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Volume"),
                Text("${settingsCubitState.volumeValue}")
              ],
            ),
          ),
        );
      },
    );
  }
}
