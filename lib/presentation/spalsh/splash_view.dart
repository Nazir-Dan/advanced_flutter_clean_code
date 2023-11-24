import 'dart:async';

import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/constants_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPrefrences _appPrefrences = instance<AppPrefrences>();

  void _goNext() async {
    _appPrefrences.isUserLogedIn().then((isUserLogedIn) => {
          if (isUserLogedIn)
            {Navigator.of(context).pushReplacementNamed(Routes.mainRout)}
          else
            {
              _appPrefrences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.loginRout)
                          }
                        else
                          {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.onBoardingRout)
                          }
                      })
            }
        });
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRout);
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  @override
  void initState() {
    // TODO: implement initState
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
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
