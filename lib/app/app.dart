import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singleton or signle instance

  factory MyApp() => _instance; // factory

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
