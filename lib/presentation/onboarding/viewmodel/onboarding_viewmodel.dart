import 'dart:async';

import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingViewModel extends BaseViewModle
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderList;
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  int goPrevious() {
    int previosPageIndex = --_currentPageIndex;
    if (previosPageIndex == -1) {
      previosPageIndex = _sliderList.length - 1;
    }
    return previosPageIndex;
  }

  @override
  int goNext() {
    int nextPageIndex = ++_currentPageIndex;
    if (nextPageIndex == _sliderList.length) {
      nextPageIndex = 0;
    }
    return nextPageIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions

  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        _sliderList[_currentPageIndex], _sliderList.length, _currentPageIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingSubTitle1.tr(), ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingSubTitle2.tr(), ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3.tr(),
            AppStrings.onBoardingSubTitle3.tr(), ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4.tr(),
            AppStrings.onBoardingSubTitle4.tr(), ImageAssets.onboardingLogo4)
      ];
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  //stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
