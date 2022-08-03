

import 'package:flutter/material.dart';
import 'package:flutter_next_level/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_next_level/303/reqres_resource/service/reqres_service.dart';

import '../../../product/service/project_dio.dart';
import '../view/req_res_view.dart';

abstract class ReqResViewModel extends State<ReqResView> with ProjectDioMixin {
  
  late final IReqresService reqresService;
  List<Data>? resources=[];

  @override
  void initState() {
    super.initState();
    reqresService=ReqresService(service);
    _fetch();
  }
  Future<void> _fetch() async {

 resources=(await reqresService.fetcResourceItem())?.data ??[];
}

}


