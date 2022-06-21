// abstract because it will be used to inherit from it
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/models.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used through any viewmodel
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs {
  // will be implemented later
}
