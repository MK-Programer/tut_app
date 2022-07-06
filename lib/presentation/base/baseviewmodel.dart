// abstract because it will be used to inherit from it
import 'dart:async';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used through any viewmodel
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  // will be implemented later

  Stream<FlowState> get outputState;
}
