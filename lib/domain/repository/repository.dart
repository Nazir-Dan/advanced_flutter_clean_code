import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequestes loginRequestes);
  Future<Either<Failure, Authentication>> register(
      RegisterRequestes registerRequestes);
  Future<Either<Failure, String>> resetPassword(String email);
  Future<Either<Failure, HomeObject>> getHomeData();
  Future<Either<Failure, StoreDetailesObject>> getStoreDetailesData();
}
