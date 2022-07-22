import 'dart:async';
import 'dart:ffi';

import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/usecase/home_usecase.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final StreamController _dataStreamController =
      BehaviorSubject<HomeViewObject>();

  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    (await _homeUseCase.execute(Void)).fold(
      (failure) => {
        // left -> failure
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        ),
      },
      (homeObject) {
        // right -> data (success)
        // content
        inputState.add(
          ContentState(),
        );
        inputHomeData.add(
          HomeViewObject(
            homeObject.homedata.stores,
            homeObject.homedata.services,
            homeObject.homedata.banners,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  // inputs
  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;
  HomeViewObject(this.stores, this.services, this.banners);
}
