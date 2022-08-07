import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_level/auto_route/dashboard/dash_board_view.dart';
import 'package:flutter_next_level/auto_route/dashboard/settings/settings_view.dart';
import 'package:flutter_next_level/auto_route/dashboard/user/user_detail_view.dart';
import 'package:flutter_next_level/auto_route/dashboard/user/user_view.dart';
import 'package:flutter_next_level/auto_route/home/home_detail_view.dart';
import 'package:flutter_next_level/auto_route/home/home_view.dart';

import '../../auto_route/dashboard/user/model/user_model.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'View,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeView,  path: 'home'),
  AutoRoute(page: HomeDetailView, path: 'detail'),
  AutoRoute(page: DashboardView, initial: true,children: [
    AutoRoute(page: SettingsView, path: 'settings'),
    AutoRoute(
      page: EmptyPageRouter,
      maintainState: true,
      name: 'UserFullRoute',
      children: [
        AutoRoute(page: UserView,initial: true, path: 'userView'),
        AutoRoute(page: UserDetailView, path: ':id'),
      ],
    ),
  ])
])

// extend the generated private router
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({Key? key}) : super(key: key);
}
