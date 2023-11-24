import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/data/data_source/local_data_source.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/language_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppPrefrences _appPrefrences = instance<AppPrefrences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  _changeLanguage() {
    _appPrefrences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  _inviteFriends() {
    //share app name to friends
  }
  _contactUs() {
    //open any web page using url
  }
  _logout() {
    // app prefs make the user loged out
    _appPrefrences.logOut();
    //clear cache of loged out user
    _localDataSource.clearCach();
    //navigate to login screen
    Navigator.pushReplacementNamed(context, Routes.loginRout);
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(padding: EdgeInsets.all(AppPadding.p8), children: [
        ListTile(
          leading: SvgPicture.asset(ImageAssets.changeLangIc),
          title: Text(
            AppStrings.changeLanguage.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Transform(
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          onTap: () {
            _changeLanguage();
          },
        ),
        ListTile(
          leading: SvgPicture.asset(ImageAssets.contactUsIc),
          title: Text(
            AppStrings.contactUs.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Transform(
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
          title: Text(
            AppStrings.inviteYourFriends.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Transform(
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          onTap: () {
            _inviteFriends();
          },
        ),
        ListTile(
          leading: SvgPicture.asset(ImageAssets.logoutIc),
          title: Text(
            AppStrings.logout.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Transform(
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          onTap: () {
            _logout();
          },
        ),
      ]),
    );
  }
}
