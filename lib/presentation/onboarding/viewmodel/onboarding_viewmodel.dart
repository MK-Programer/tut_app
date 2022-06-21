import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers outputs

  // OnBoarding ViewModelInputs
  @override
  void start() {}

  @override
  void dispose() {}

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}
}

// inputs mean that "Orders" that our view model will recieve from  view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swip left
  void goPrevious(); // when user clicks on left arrow or swip right
  void onPageChanged(int index);
}

abstract class OnBoardingViewModelOutputs {}
