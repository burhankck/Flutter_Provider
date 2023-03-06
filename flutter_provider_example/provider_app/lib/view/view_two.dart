import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/global/resource_context.dart';

class ViewTwo extends StatefulWidget {
  const ViewTwo({super.key});

  @override
  State<ViewTwo> createState() => _ViewTwoState();
}

class _ViewTwoState extends State<ViewTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CircleAvatar(
          child: Text(
              context.read<ResourceContext>().model?.data?.length.toString() ??
                  ''),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          height: 300,
          width: 200,
        ),
      ),
    );
  }
}
