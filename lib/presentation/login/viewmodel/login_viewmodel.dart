import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // inputs
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  Sink get inputPassword => throw UnimplementedError();

  @override
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    throw UnimplementedError();
  }

  // outputs

  @override
  Stream<bool> get outIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outIsUserNameValid => throw UnimplementedError();
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}
