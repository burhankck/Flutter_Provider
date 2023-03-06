import 'package:dio/dio.dart';
import 'package:provider_app/model/model.dart';
import 'package:provider_app/product/project_dio.dart';
import 'package:provider_app/service/service.dart';

import '../view/view.dart';
import 'package:flutter/material.dart';

abstract class ReqresViewModel extends State<ResourceView>
    with PRrojectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
    
  }

  Future<void> _fetch() async {
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
  }
}
