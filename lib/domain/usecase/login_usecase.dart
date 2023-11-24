import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequestes(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
