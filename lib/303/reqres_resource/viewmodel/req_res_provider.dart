

import 'package:flutter/widgets.dart';
import 'package:flutter_next_level/product/global/resource_context.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  
     final IReqresService reqresService;
  List<Data>? resources=[];
  bool isLoading=false;
  void _changeLoading(){
    isLoading=!isLoading;
    notifyListeners();
  }
  ReqResProvider(this.reqresService){
    _fetch();
  }

  
  Future<void> _fetch() async {
_changeLoading();
 resources=(await reqresService.fetcResourceItem())?.data ??[];
 _changeLoading();
}
void saveToLocale(ResourceContext resourceContext){
  resourceContext.saveModel(ResourceModel(data: resources));
}
}