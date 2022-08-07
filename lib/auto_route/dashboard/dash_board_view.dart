import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_level/product/navigator/app_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AutoTabsRouter.tabBar(
      routes: [
        UserFullRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, tabController) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:context.tabsRouter.activeIndex ,
            onTap:context.tabsRouter.setActiveIndex,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.person),label: UserRoute().routeName),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: SettingsRoute().routeName),
          ]),
          
        );
      },
    );
  }
}
