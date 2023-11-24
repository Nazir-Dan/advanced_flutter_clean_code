import 'package:advanced_flutter_tut/data/data_source/local_data_source.dart';
import 'package:advanced_flutter_tut/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_tut/data/mapper/mapper.dart';
import 'package:advanced_flutter_tut/data/network/error_handler.dart';
import 'package:advanced_flutter_tut/data/network/netowrk_info.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequestes loginRequestes) async {
    if (await _networkInfo.isConnected) {
      //connected to internet
      try {
        final response = await _remoteDataSource.login(loginRequestes);
        if (response.status == ApiInternalStatus.success) {
          //success
          return Right(response.toDomain());
        } else {
          //failer, (buisness error)
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponceMessage.DEFAULT));
        }
      } catch (e) {
        return left(ErrorHandler.handle(e).failure);
      }
    } else {
      //not connected, return connection error
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(String email) async {
    if (await _networkInfo.isConnected) {
      //connected to internet
      try {
        final response = await _remoteDataSource.resetPassword(email);
        if (response.status == ApiInternalStatus.success) {
          //success
          return Right(response.toDomain());
        } else {
          //failer, (buisness error)
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponceMessage.DEFAULT));
        }
      } catch (e) {
        return left(ErrorHandler.handle(e).failure);
      }
    } else {
      //not connected, return connection error
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequestes registerRequestes) async {
    if (await _networkInfo.isConnected) {
      //connected to internet
      try {
        final response = await _remoteDataSource.register(registerRequestes);
        if (response.status == ApiInternalStatus.success) {
          //success
          return Right(response.toDomain());
        } else {
          //failer, (buisness error)
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponceMessage.DEFAULT));
        }
      } catch (e) {
        return left(ErrorHandler.handle(e).failure);
      }
    } else {
      //not connected, return connection error
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    try {
      //get responce from cache
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache does not exist or invalid
      //so we get the responce from the api

      if (await _networkInfo.isConnected) {
        //connected to internet
        try {
          final response = await _remoteDataSource.getHomeData();
          if (response.status == ApiInternalStatus.success) {
            //success
            //save home resposce to cache (localDataSource)
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          } else {
            //failer, (buisness error)
            return left(Failure(ApiInternalStatus.failure,
                response.message ?? ResponceMessage.DEFAULT));
          }
        } catch (e) {
          return left(ErrorHandler.handle(e).failure);
        }
      } else {
        //not connected, return connection error
        return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StoreDetailesObject>> getStoreDetailesData() async {
    try {
      //get responce from cache
      final response = await _localDataSource.getStoreDetailesData();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache does not exist or invalid
      //so we get the responce from the api
      print(cacheError);
      if (await _networkInfo.isConnected) {
        //connected to internet
        try {
          final response = await _remoteDataSource.getStoreDetailesData();
          if (response.status == ApiInternalStatus.success) {
            //success
            //save home resposce to cache (localDataSource)
            _localDataSource.saveStoreDetailesToCache(response);
            return Right(response.toDomain());
          } else {
            //failer, (buisness error)
            return left(Failure(ApiInternalStatus.failure,
                response.message ?? ResponceMessage.DEFAULT));
          }
        } catch (e) {
          return left(ErrorHandler.handle(e).failure);
        }
      } else {
        //not connected, return connection error
        return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
