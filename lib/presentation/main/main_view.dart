import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/main/pages/home_page.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/main/pages/notifications_page.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/main/pages/search_page.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/main/pages/settings_page.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    SettingsPage(),
  ];

  List<String> titles = const [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  var title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGrey,
              spreadRadius: AppSize.s1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: AppStrings.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              label: AppStrings.notifications,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: AppStrings.settings,
            ),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(
      () {
        _currentIndex = index;
        title = titles[index];
      },
    );
  }
}
