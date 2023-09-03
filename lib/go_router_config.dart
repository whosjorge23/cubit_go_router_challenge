import 'package:cubit_go_router_challenge/cubit/settings_cubit.dart';
import 'package:cubit_go_router_challenge/cubit/volume_cubit.dart';
import 'package:cubit_go_router_challenge/home_screen.dart';
import 'package:cubit_go_router_challenge/settings_screen.dart';
import 'package:cubit_go_router_challenge/volume_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


final GoRouter goRouterConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(title: 'Flutter Cubit Challenge',);
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider<SettingsCubit>(create: (BuildContext context) => SettingsCubit(),
            child: const SettingsScreen());
          },
        ),
        GoRoute(
          path: 'volume',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider<SettingsCubit>(create:(BuildContext context) => SettingsCubit(),
            child: const VolumeScreen());
          },
        ),
      ],
    ),
  ],
);