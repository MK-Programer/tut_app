import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/app_api.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<ForgetPasswordResponse> forgetPassword(String email);
  Future<HomeResponse> getHomeData();
  Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppSerivceClient _appSerivceClient;

  RemoteDataSourceImpl(this._appSerivceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appSerivceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) async {
    return await _appSerivceClient.forgetPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appSerivceClient.register(
      registerRequest.userName,
      registerRequest.countryMobileCode,
      registerRequest.mobileNumber,
      registerRequest.email,
      registerRequest.password,
      "",
    );
  }

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appSerivceClient.getHomeData();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appSerivceClient.getStoreDetails();
  }
}
