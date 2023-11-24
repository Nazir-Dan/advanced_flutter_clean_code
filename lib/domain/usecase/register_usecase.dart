import 'package:advanced_flutter_tut/data/network/failure.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  Repository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequestes(
        input.userName,
        input.password,
        input.mobileCountryCode,
        input.mobileNumber,
        input.email,
        input.profilePicture));
  }
}

class RegisterUseCaseInput {
  String userName;
  String password;
  String mobileCountryCode;
  String mobileNumber;
  String email;
  String profilePicture;
  RegisterUseCaseInput(this.userName, this.password, this.mobileCountryCode,
      this.mobileNumber, this.email, this.profilePicture);
}
