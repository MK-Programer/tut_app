import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/mapper/mapper.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/network_info.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet , its safe to call API
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // success
        // return either right
        // return data
        return Right(response.toDomain());
      } else {
        // failure -- business error
        // return either left
        return Left(Failure(409, response.message ?? "business error message"));
      }
    } else {
      // return internet connection error
      // return either left
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
