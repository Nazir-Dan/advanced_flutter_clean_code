import 'dart:async';
import 'dart:io';

import 'package:advanced_flutter_tut/app/functions.dart';
import 'package:advanced_flutter_tut/domain/usecase/register_usecase.dart';
import 'package:advanced_flutter_tut/presentation/base/basse_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/common/freezed_data_class.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterViewModel extends BaseViewModle
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController profilePictureStreamController =
      StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserRegisteredSuccessfullyStreamController =
      StreamController<bool>();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject('', '', '', '', '', '');

  RegisterViewModel(this._registerUseCase);

  @override
  void start() {
    inputtState.add(ContentState());
  }

  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredSuccessfullyStreamController.close();
    super.dispose();
  }

  //inputs

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassowrd => passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  register() async {
    inputtState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.userName,
            registerObject.password,
            registerObject.mobileCountryCode,
            registerObject.mobileNumber,
            registerObject.email,
            registerObject.profilePicture)))
        .fold(
            (failure) => {
                  //left -> failure
                  inputtState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      //right -> data
      inputtState.add(ContentState());
      //navigate to main screen
      isUserRegisteredSuccessfullyStreamController.add(true);
    });
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      //update register view object
      registerObject = registerObject.copyWith(userName: userName);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(userName: '');
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassowrd.add(password);
    if (_isPasswordValid(password)) {
      //update register view object
      registerObject = registerObject.copyWith(password: password);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(password: '');
    }
    validate();
  }

  @override
  setContrycode(String contryCode) {
    if (contryCode.isNotEmpty) {
      //update register view object
      registerObject = registerObject.copyWith(mobileCountryCode: contryCode);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(mobileCountryCode: '');
    }
    validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      //update register view object
      registerObject = registerObject.copyWith(email: email);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(email: '');
    }
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      //update register view object
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(mobileNumber: '');
    }
    validate();
  }

  @override
  setprofilePicture(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    if (profilePicture.path.isNotEmpty) {
      //update register view object
      registerObject =
          registerObject.copyWith(profilePicture: profilePicture.path);
    } else {
      //reset username value in register view object
      registerObject = registerObject.copyWith(profilePicture: '');
    }
    validate();
  }

  validate() {
    inputAreAllInputsValid.add(null);
  }

  //outputs

  @override
  Stream<bool> get outIsEmailValid =>
      emailStreamController.stream.map((email) => isEmailValid(email));
  @override
  Stream<String?> get outErrorEmail => outIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.invalidEmail.tr());

  @override
  Stream<bool> get outIsMobileNumberValid => mobileNumberStreamController.stream
      .map((mobilNumber) => _isMobileNumberValid(mobilNumber));
  @override
  Stream<String?> get outErrorMobileNumber =>
      outIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : AppStrings.mobileNumberInvalid.tr());

  @override
  Stream<bool> get outIsPassowrdValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));
  @override
  Stream<String?> get outErrorPassowrd => outIsPassowrdValid.map(
      (isPasswordValid) => isPasswordValid ? null : AppStrings.passwordInvalid.tr());

  @override
  Stream<bool> get outIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));
  @override
  Stream<String?> get outErrorUserName => outIsUserNameValid.map(
      (isUserNameValid) => isUserNameValid ? null : AppStrings.userNameInvalid.tr());

  @override
  Stream<File> get outIsProfilePicture =>
      profilePictureStreamController.stream.map((profilePic) => profilePic);

  @override
  Stream<bool> get outAreAllinputsValid =>
      areAllInputsValidStreamController.stream
          .map((_) => _areAllInputesValid());

  // --private functions

  bool _areAllInputesValid() {
    return (registerObject.mobileCountryCode.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.userName.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.profilePicture.isNotEmpty &&
        registerObject.email.isNotEmpty);
  }

  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isMobileNumberValid(String mobilNumber) {
    return mobilNumber.length >= 10;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }
}

abstract class RegisterViewModelInputs {
  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setContrycode(String contryCode);
  setEmail(String email);
  setprofilePicture(File profilePicture);
  setPassword(String password);
  register();
  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassowrd;
  Sink get inputProfilePicture;
  Sink get inputAreAllInputsValid;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<String?> get outErrorUserName;

  Stream<bool> get outIsMobileNumberValid;
  Stream<String?> get outErrorMobileNumber;

  Stream<bool> get outIsEmailValid;
  Stream<String?> get outErrorEmail;

  Stream<bool> get outIsPassowrdValid;
  Stream<String?> get outErrorPassowrd;

  Stream<File> get outIsProfilePicture;

  Stream<bool> get outAreAllinputsValid;
}
