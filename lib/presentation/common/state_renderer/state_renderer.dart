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
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context);
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
                    _getRetryButton(context, AppStrings.retryAgain),
                  ],
                );
              case StateRendererType.fullScreenEmptyState:
        
              case StateRendererType.contentState:
            }
          }

          Widget _getPopUpDialog(BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s14,),
              ),
              elevation: AppSize.s1_5,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(AppSize.s14,),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: _getDialogContent(context),
              ),
            );
            
          }

          Widget _getDialogContent(BuildContext buildContext){

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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  message,
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
            );
          }
        
          Widget _getRetryButton(BuildContext context, String buttonTitle) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p18),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (stateRendererType == StateRendererType.fullScreenErrorState) {
                        // call retry function
                        retryActionFunction.call()
                      } else { // popup error state
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      buttonTitle,
                    ),
                  ),
                ),
              ),
            );
          }
        
  
}
