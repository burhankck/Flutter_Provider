import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/global/global.dart';
import 'package:provider_app/global/resource_context.dart';
import 'package:provider_app/global/theme_notifier.dart';
import 'package:provider_app/product/project_dio.dart';
import 'package:provider_app/service/service.dart';
import 'package:provider_app/vievModel/provider_view_model.dart';
import 'package:provider_app/vievModel/view_model.dart';
import 'package:provider_app/view/view_two.dart';

import '../model/model.dart';

class ResourceView extends StatefulWidget {
  const ResourceView({super.key});

  @override
  State<ResourceView> createState() => _ResourceViewState();
}

class _ResourceViewState extends State<ResourceView> with PRrojectDioMixin {
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
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: [
                Container(
                    color: Colors.amber,
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<ReqResProvider>()
                              .saveLocale(context.read<ResourceContext>());
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const ViewTwo();
                            },
                          ));
                        },
                        icon: Icon(
                          Icons.save,
                          color: Colors.black,
                        )))
              ],
              centerTitle: true,
              title: context.watch<ReqResProvider>().isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(builder: (context, value, child) {
                return value ? Placeholder() : Text('Flutter');
              }, selector: (context, provider) {
                return provider.isLoading;
              }),
              Expanded(
                child: _resourceListView(
                    context, context.watch<ReqResProvider>().resources),
              ),
              Selector<ReqResProvider, bool>(builder: (context, value, child) {
                return value
                    ? Container(color: Colors.green, width: 200, height: 200)
                    : Container(color: Colors.red, width: 200, height: 250);
              }, selector: (context, provider) {
                return provider.isLoading;
              }),
              const SizedBox(height: 70),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (context, index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      },
    );
  }
}
