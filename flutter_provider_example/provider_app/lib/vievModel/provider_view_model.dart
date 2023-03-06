import 'package:flutter/material.dart';
import 'package:provider_app/global/resource_context.dart';
import 'package:provider_app/model/model.dart';

import '../service/service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;
  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
    // Ekrana haber vermek icin notify kullaniriz.
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }

  void saveLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
