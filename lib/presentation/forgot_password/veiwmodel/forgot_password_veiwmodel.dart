import 'dart:async';

import 'package:advanced_flutter_tut/domain/usecase/forgot_password_usecase.dart';
import 'package:advanced_flutter_tut/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_tut/app/functions.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/common/freezed_data_class.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';

class ResetPasswordVeiwModel extends BaseViewModle
    with ResetPasswordViewModelInputs, ResetPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  var emailObject = '';

  ResetPasswordVeiwModel(this._forgotPasswordUseCase);
  //LoginViewModel();

  //inputs
  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // view model sould tell view: please show content state
    inputtState.add(ContentState());
  }

  @override
  Sink get inputEmailName => _emailStreamController.sink;

  @override
  Sink get inputAreAllDataValid => _areAllInputsValidStreamController.sink;

  @override
  setEmail(String email) {
    inputEmailName.add(email);
    emailObject = email;
    _validate();
  }

  @override
  resetPassword() async {
    inputtState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(emailObject)).fold(
        (failure) => {
              //left -> failure
              inputtState.add(ErrorState(
                  StateRendererType.popupErrorState, failure.message))
            }, (data) {
      //right -> data
      //inputtState.add(ContentState());
      //show success popup
      inputtState.add(SuccessState(data));
      //isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  //outputs

  @override
  Stream<bool> get outIsUserNameValid =>
      _emailStreamController.stream.map((userName) => isEmailValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return (isEmailValid(emailObject));
  }

  void _validate() {
    inputAreAllDataValid.add(null);
  }
}

abstract class ResetPasswordViewModelInputs {
  setEmail(String userName);
  resetPassword();
  Sink get inputEmailName;
  Sink get inputAreAllDataValid;
}

abstract class ResetPasswordViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outAreAllInputsValid;
}
