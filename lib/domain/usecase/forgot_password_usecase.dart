import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  Repository _repository;
  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.resetPassword(input);
  }
}
