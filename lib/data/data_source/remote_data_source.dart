import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/app_api.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppSerivceClient _appSerivceClient;

  RemoteDataSourceImpl(this._appSerivceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appSerivceClient.login(
        loginRequest.email, loginRequest.password);
  }
}
