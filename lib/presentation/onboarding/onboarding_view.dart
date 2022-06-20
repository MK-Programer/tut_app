import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey2,
      body: const Center(
        child: Text(
          "Welcome to on boarding",
        ),
      ),
    );
  }
}
