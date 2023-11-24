import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_class.freezed.dart';
//part 'freezed_data_class.g.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String Password) = _LoginObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
      String userName,
      String password,
      String mobileCountryCode,
      String mobileNumber,
      String email,
      String profilePicture) = _RegisterObject;
}

@freezed
class HomeViewObject with _$HomeViewObject {
  factory HomeViewObject(
    List<BannerAdd> banners,
    List<Service> services,
    List<Store> stores,
  ) = _HomeViewObject;
}
