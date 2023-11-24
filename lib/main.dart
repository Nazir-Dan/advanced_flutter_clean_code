import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/app/myApp.dart';
import 'package:advanced_flutter_tut/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALIZATION,
      child: Phoenix(child: MyApp())));
}
