import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
