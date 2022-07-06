import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/constants.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendereType();
  String getMessage();
}

// loading state (POPUP, FULLSCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendereType() => stateRendererType;
}

// error state (POPUP, FULLSCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendereType() => stateRendererType;
}

// content state
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendereType() => StateRendererType.contentState;
}

// empty state
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendereType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          break;
        }
      case ErrorState:
        {
          break;
        }
      case EmptyState:
        {
          break;
        }
      case ContentState:
        {
          break;
        }
      default:
        {
          break;
        }
    }
  }
}
