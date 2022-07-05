import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/font_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/styles_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';

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
        return _getItemsColumn(
          [
            _getAnimatedImage(),
            _getMessage(message),
          ],
        );
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn(
          [
            _getAnimatedImage(),
            _getMessage(message),
            _getRetryButton(AppStrings.retryAgain),
          ],
        );
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

  Widget _getAnimatedImage() {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Container(), // todo add json image here
    );
  }

  Widget _getMessage(String message) {
    return Text(
      message,
      style: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        buttonTitle,
      ),
    );
  }
}
