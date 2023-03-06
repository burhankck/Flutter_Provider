import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_app/model/model.dart';

abstract class IReqresService {
  final Dio dio;
  IReqresService(this.dio);

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqresPath { 
  resource
}
class ReqresService extends IReqresService {
    ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqresPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
