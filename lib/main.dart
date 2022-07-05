import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/app.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/di.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
