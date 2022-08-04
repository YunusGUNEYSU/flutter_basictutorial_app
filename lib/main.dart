import 'package:flutter/material.dart';
import 'package:flutter_next_level/product/global/resource_context.dart';
import 'package:flutter_next_level/product/global/theme_notifer.dart';
import 'package:provider/provider.dart';

import '303/reqres_resource/view/req_res_view.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => ResourceContext(),),
    ChangeNotifierProvider<ThemeNotifer>(create:(context) =>  ThemeNotifer())
  ],
  builder: (context, child) => const MyApp(),
  
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,
      
      home:  const ReqResView(),
    );
  }
}


 