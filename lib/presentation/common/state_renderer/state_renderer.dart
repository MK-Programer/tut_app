import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';

enum StateRendererType {
  // POP STATES (DIALOG)
  popupLoadingState,
  popupErrorState,

  // FULL SCREEN STATES (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState,
}

// ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;

  Function retryActionFunction;

  StateRenderer({
    Key? key,
    required this.stateRendererType,
    this.message = AppStrings.loading,
    this.title = "",
    required this.retryActionFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getStateWidget() {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:

      case StateRendererType.popupErrorState:

      case StateRendererType.fullScreenLoadingState:

      case StateRendererType.fullScreenErrorState:

      case StateRendererType.fullScreenEmptyState:

      case StateRendererType.contentState:
    }
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
