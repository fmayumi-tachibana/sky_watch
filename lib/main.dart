import 'package:flutter/material.dart';
import 'package:sky_watch/core/dependence_injection/dependence_injection.dart';
import 'package:sky_watch/home/presenter/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DependenceInjection _dependenceInjection = DependenceInjection();
  @override
  void initState() {
    _dependenceInjection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //fazer versão para ios
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
