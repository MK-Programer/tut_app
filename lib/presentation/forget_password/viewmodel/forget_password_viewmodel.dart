import 'dart:async';

import 'package:flutter_advanced_clean_architecture_with_mvvm/app/functions.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/usecase/forget_password_usecase.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';

class ForgetPasswordViewModel extends BaseViewModel
    with ForgetPasswordViewModelInput, ForgetPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordViewModel(this._forgetPasswordUseCase);

  var email = "";

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _forgetPasswordUseCase.execute(email)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.popupErrorState,
            failure.message,
          ),
        );
      },
      (supportMessage) {
        inputState.add(
          ContentState(),
        );
      },
    );
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  // output
  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  Stream<bool> get outputIsEmailValid => _emailStreamController.stream.map(
        (email) => isEmailValid(
          email,
        ),
      );

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map(
        (isAllInputValid) => _isAllInputValid(),
      );

  _isAllInputValid() {
    return isEmailValid(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }
}

abstract class ForgetPasswordViewModelInput {
  forgotPassword();

  setEmail(String email);

  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

abstract class ForgetPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}
