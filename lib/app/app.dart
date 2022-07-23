import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/di.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';

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
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
