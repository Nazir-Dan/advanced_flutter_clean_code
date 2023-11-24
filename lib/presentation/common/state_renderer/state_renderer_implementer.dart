import 'package:advanced_flutter_tut/app/constants.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

// loading state (pop up, full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (pop up, full screen)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// popup success state (pop up)
class SuccessState extends FlowState {
  //StateRendererType stateRendererType;
  String message;

  SuccessState(this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupSuccessState;
}

// content state
class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// content state
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtention on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            //show popup loading
            showPopUp(context, getStateRendererType(), getMessage());
            //show content ui of the screen
            return contentScreenWidget;
          } else {
            //full screen loading state
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            //show popup error
            showPopUp(context, getStateRendererType(), getMessage());
            //show content ui of the screen
            return contentScreenWidget;
          } else {
            //full screen error state
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case SuccessState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupSuccessState) {
            //show popup
            showPopUp(context, getStateRendererType(), getMessage(),
                title: AppStrings.success.tr());
            //show content ui of the screen
            return contentScreenWidget;
          } else {
            //full screen error state
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case EmptyState:
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)!.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constants.empty}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => StateRenderer(
            stateRendererType: stateRendererType,
            title: title,
            message: message,
            retryActionFunction: () {}),
      ),
    );
  }
}
