import 'dart:async';

import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/usecase/home_usecase.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel {
  final StreamController _bannersStreamController =
      BehaviorSubject<List<BannerAd>>();
  final StreamController _servicesStreamController =
      BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController =
      BehaviorSubject<List<Store>>();

  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {}

  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }
}
