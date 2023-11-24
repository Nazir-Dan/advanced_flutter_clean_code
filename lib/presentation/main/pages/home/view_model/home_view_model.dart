import 'dart:async';
import 'dart:ffi';

import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/usecase/home_usecase.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/common/freezed_data_class.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModle
    with HomeViewModelInputs, HomeViewModelOutputs {
  final HomeUseCase _homeUseCase;
  var homeViewObject = HomeViewObject([], [], []);

  final StreamController homeViewObjectStreamConroller =
      BehaviorSubject<HomeViewObject>();
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    homeViewObjectStreamConroller.close();
    super.dispose();
  }

  _getHomeData() async {
    inputtState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenloadingState));
    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              //left -> failure
              inputtState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      //right -> data
      inputtState.add(ContentState());
      _setHomeViewObject(homeObject);
      inputHomeViewObject.add(homeViewObject);
      //navigate to main screen
    });
  }

  void _setHomeViewObject(HomeObject homeObject) {
    homeViewObject = homeViewObject.copyWith(
        banners: homeObject.data.banners,
        services: homeObject.data.services,
        stores: homeObject.data.stores);
  }

  //inputs
  @override
  Sink get inputHomeViewObject => homeViewObjectStreamConroller.sink;

  //outputs
  @override
  Stream<HomeViewObject> get outHomeViewObject =>
      homeViewObjectStreamConroller.stream.map((homeData) => homeData);
}

abstract class HomeViewModelInputs {
  Sink get inputHomeViewObject;
}

abstract class HomeViewModelOutputs {
  Stream<HomeViewObject> get outHomeViewObject;
}
