import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/constants.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppSerivceClient {
  factory AppSerivceClient(Dio dio, {String? baseUrl}) = _AppSerivceClient;

  @POST("/customers/login")
  Future<AuthenticatorResponse> login(
      @Field("email") String email, @Field("password") String password);
}
