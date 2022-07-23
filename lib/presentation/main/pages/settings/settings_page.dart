import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/di.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/data_source/local_data_source.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        children: [
          ListTile(
            leading: SvgPicture.asset(
              ImageAssets.changeLangIc,
            ),
            title: Text(
              AppStrings.changeLanguage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(
              ImageAssets.rightArrowSettingsIc,
            ),
            onTap: () {
              _changeLanguage();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              ImageAssets.contactUsIc,
            ),
            title: Text(
              AppStrings.contactUs,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(
              ImageAssets.rightArrowSettingsIc,
            ),
            onTap: () {
              _contactUs();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              ImageAssets.inviteFriendsIc,
            ),
            title: Text(
              AppStrings.inviteYourFriends,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(
              ImageAssets.rightArrowSettingsIc,
            ),
            onTap: () {
              _inviteFriends();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              ImageAssets.logoutIc,
            ),
            title: Text(
              AppStrings.logout,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(
              ImageAssets.rightArrowSettingsIc,
            ),
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }

  _changeLanguage() {
    // i will implement it later
  }

  _contactUs() {
    // it is a task for you to open any webpage using URL
  }

  _inviteFriends() {
    // it is a task for you to share app name with friends
  }

  _logout() {
    // app prefs make that user logged out
    _appPreferences.logout();
    // clear cache of loggedout user
    _localDataSource.clearCache();
    // navigate to login screen
    Navigator.pushReplacementNamed(
      context,
      Routes.loginRoute,
    );
  }
}
