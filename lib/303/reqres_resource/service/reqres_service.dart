



import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_next_level/303/reqres_resource/model/resource_model.dart';

 abstract class IReqresService {
    Dio dio();
  Future<ResourceModel?> fetcResourceItem();
}
enum _ReqresPath{
resource,
}

class ReqresService extends IReqresService {
  ReqresService(Dio dio);

 
 @override
  Dio dio() => Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
  @override
  Future<ResourceModel?> fetcResourceItem() async {
    final response= await dio().get('/${_ReqresPath.resource.name}');

    if (response.statusCode==HttpStatus.ok) {
      final jsonbody=response.data;
      if (jsonbody is Map<String,dynamic>) {
        return ResourceModel.fromJson(jsonbody);
      }
    }
    return null;
  }
  
 
  
}