import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/constants_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _onboardingPageCotroller = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPrefrences _appPrefrences = instance<AppPrefrences>();

  _bind() {
    _appPrefrences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data!);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _onboardingPageCotroller,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          //height: AppSize.s100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginRout);
                  },
                  child: Text(
                    AppStrings.skip.tr(),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCirlceIc);
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _onboardingPageCotroller.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationDuration,
                    ),
                    curve: Curves.bounceInOut);
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _onboardingPageCotroller.animateToPage(
                  _viewModel.goNext(),
                  duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationDuration,
                  ),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._slider, {Key? key}) : super(key: key);
  final SliderObject _slider;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _slider.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _slider.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_slider.image),
      ],
    );
    ;
  }
}
