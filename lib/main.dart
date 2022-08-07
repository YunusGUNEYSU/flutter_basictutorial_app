import 'package:flutter/material.dart';
import 'package:flutter_next_level/product/global/resource_context.dart';
import 'package:flutter_next_level/product/global/theme_notifer.dart';
import 'package:flutter_next_level/product/navigator/app_router.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import '303/lottie_learn.dart';
import '303/mobx_image_picker/view/mobx_image_upload.dart';
import 'auto_route/home/home_view.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => ResourceContext(),),
    ChangeNotifierProvider<ThemeNotifer>(create:(context) =>  ThemeNotifer())
  ],
  builder: (context, child) =>  MyApp(),
  
  ));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final _appRouter=AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routeInformationParser:_appRouter.defaultRouteParser() , routerDelegate: _appRouter.delegate(),);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,
      
      home:  const HomeView(),
    );
  }
}


 