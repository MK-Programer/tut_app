import 'dart:async';
import 'dart:io';

import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';

class RegisterViewModel extends BaseViewModel {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController profilePictureStreamController =
      StreamController<File>.broadcast();
  StreamController areAllInputsVaildStreamController =
      StreamController<void>.broadcast();

  @override
  void start() {}

  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsVaildStreamController.close();
    super.dispose();
  }
}
