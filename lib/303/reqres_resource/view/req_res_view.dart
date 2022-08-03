

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_next_level/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_next_level/303/reqres_resource/viewmodel/req_res_provider.dart';
import 'package:flutter_next_level/product/extension/string_extension.dart';
import 'package:flutter_next_level/product/global/resource_context.dart';
import 'package:flutter_next_level/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../../../product/global/theme_notifer.dart';
import '../model/resource_model.dart';


class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          
          floatingActionButton: FloatingActionButton(
            onPressed: () {
               context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
            context.read<ThemeNotifer>().changeTheme();
          },),
        appBar: AppBar(actions: [IconButton(onPressed: () {
          
        }, icon:const Icon(Icons.save_alt_outlined))],
          title:context.watch<ReqResProvider>().isLoading?const CircularProgressIndicator(color: Colors.black12,):null),
        body: Column(
          children: [
          Selector<ReqResProvider,bool>(builder:(context, value, child) {
            return value?const Placeholder(): const Text('data');
          }, selector: (context, provider) {
            return provider.isLoading;
          },),
            Expanded(child: resourseListView(context,context.watch<ReqResProvider>().resources)),
          ],
        ),
      );
      },
    
    );
  }

  ListView resourseListView(BuildContext context,List<Data>? items) {
    return ListView.builder(
        itemCount: context.watch<ReqResProvider>().resources?.length,
        itemBuilder:
         (BuildContext context, int index) {
          
          return Card(
            color: Color(items![index].color!.colorValue),
            child: Text(items[index].name??'')) ;
        },
      );
  }
}