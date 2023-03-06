import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/global/resource_context.dart';
import 'package:provider_app/global/theme_notifier.dart';
import 'package:provider_app/view/view.dart';
import 'package:provider_app/view/view_two.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => ResourceContext()),
      ChangeNotifierProvider(create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: context.watch <ThemeNotifier>().currentTheme,
        home: const ResourceView());
  }
}
