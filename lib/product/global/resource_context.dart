
import 'package:flutter_next_level/303/reqres_resource/model/resource_model.dart';

class ResourceContext {
  ResourceModel ? model;

  void saveModel(ResourceModel model){
      this.model=model;
  }
}