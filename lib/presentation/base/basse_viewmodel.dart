import 'dart:async';

import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModle extends BaseViewModleInputs
    with BaseViewModleOutputs {
  final StreamController _inputStreamController = BehaviorSubject<FlowState>();
  @override
  Sink get inputtState => _inputStreamController.sink;
  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModleInputs {
  void start();
  void dispose();
  Sink get inputtState;
}

abstract class BaseViewModleOutputs {
  Stream<FlowState> get outputState;
}
