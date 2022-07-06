import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/di.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/constants_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) => {
            if (isUserLoggedIn)
              {
                // navigate to main screen
                Navigator.pushReplacementNamed(context, Routes.mainRoute)
              }
            else
              {
                _appPreferences.isOnBoardingScreenViewed().then(
                      (isOnBoardingViewed) => {
                        if (isOnBoardingViewed)
                          {
                            // navigate to login
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            // navigate to onboarding screen
                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute)
                          }
                      },
                    ),
              },
          },
        );
    // Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
