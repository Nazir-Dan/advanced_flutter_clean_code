import 'dart:async';

import 'package:advanced_flutter_tut/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/common/freezed_data_class.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';

class LoginViewModel extends BaseViewModle
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  final LoginUseCase _loginUseCase;
  var loginObject = LoginObject('', '');

  LoginViewModel(this._loginUseCase);
  //LoginViewModel();

  //inputs
  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // view model sould tell view: please show content state
    inputtState.add(ContentState());
  }

  @override
  Sink get inputPassowrd => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputareAllDataValid => _areAllInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassowrd.add(password);
    loginObject = loginObject.copyWith(Password: password);
    inputareAllDataValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputareAllDataValid.add(null);
  }

  @override
  login() async {
    inputtState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.Password)))
        .fold(
            (failure) => {
                  //left -> failure
                  inputtState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      //right -> data
      inputtState.add(ContentState());
      //navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  //outputs
  @override
  Stream<bool> get outIsPassowrdValid => _passwordStreamController.stream
      .map((password) => _isPassowrdValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isPassowrdValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return (_isPassowrdValid(loginObject.Password) &&
        _isUserNameValid(loginObject.userName));
  }
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get inputUserName;
  Sink get inputPassowrd;
  Sink get inputareAllDataValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPassowrdValid;
  Stream<bool> get outAreAllInputsValid;
}
