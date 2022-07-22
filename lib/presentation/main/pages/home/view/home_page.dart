import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.home,
      ),
    );
  }
}
