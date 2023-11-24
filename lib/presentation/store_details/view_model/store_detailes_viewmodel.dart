import 'dart:async';
import 'dart:ffi';

import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/usecase/store_detailes_usecase.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailesViewModel extends BaseViewModle
    with StoreDetailesViewModelInputs, StoreDetailesViewModelOutputs {
  final StoreDetailesUseCase _storeDetailesUseCase;
  final StreamController storeDetailesViewObjectStreamConroller =
      BehaviorSubject<StoreDetailesViewObject>();
  StoreDetailesViewModel(this._storeDetailesUseCase);

  @override
  void start() {
    _getStoreDetailesData();
  }

  @override
  void dispose() {
    storeDetailesViewObjectStreamConroller.close();
    super.dispose();
  }

  _getStoreDetailesData() async {
    inputtState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenloadingState));
    (await _storeDetailesUseCase.execute(Void)).fold(
        (failure) => {
              //left -> failure
              inputtState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (storeDetailesObject) {
      //right -> data
      inputtState.add(ContentState());

      inputStoreDetailesViewObject
          .add(_getStoreDetailesViewObject(storeDetailesObject));
      //navigate to main screen
    });
  }

  StoreDetailesViewObject _getStoreDetailesViewObject(
      StoreDetailesObject storeDetailesObject) {
    return StoreDetailesViewObject(
        storeDetailesObject.id,
        storeDetailesObject.image,
        storeDetailesObject.title,
        storeDetailesObject.details,
        storeDetailesObject.services,
        storeDetailesObject.about);
  }

  //inputs
  @override
  Sink get inputStoreDetailesViewObject =>
      storeDetailesViewObjectStreamConroller.sink;

  //outputs
  @override
  Stream<StoreDetailesViewObject> get outStoreDetailesViewObject =>
      storeDetailesViewObjectStreamConroller.stream
          .map((StoreDetailesData) => StoreDetailesData);
}

abstract class StoreDetailesViewModelInputs {
  Sink get inputStoreDetailesViewObject;
}

abstract class StoreDetailesViewModelOutputs {
  Stream<StoreDetailesViewObject> get outStoreDetailesViewObject;
}

class StoreDetailesViewObject {
  int id;
  String image;
  String title;
  String details;
  String services;
  String about;

  StoreDetailesViewObject(
      this.id, this.image, this.title, this.details, this.services, this.about);
}
