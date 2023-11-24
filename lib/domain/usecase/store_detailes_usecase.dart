import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class StoreDetailesUseCase implements BaseUseCase<void, StoreDetailesObject> {
  Repository _repository;

  StoreDetailesUseCase(this._repository);

  @override
  Future<Either<Failure, StoreDetailesObject>> execute(void input) async {
    return await _repository.getStoreDetailesData();
  }
}
