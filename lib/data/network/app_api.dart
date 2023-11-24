import 'package:advanced_flutter_tut/app/constants.dart';
import 'package:advanced_flutter_tut/data/response/responces.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl = ''}) =>
      _AppServiceClient(dio);

  @POST('/customers/login')
  Future<AuthenticatioResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST('/customers/forgetPassword')
  Future<ForgotPasswordResponse> resetPassword(
    @Field('email') String email,
  );

  @POST('/customers/register')
  Future<AuthenticatioResponse> register(
    @Field('userName') String userName,
    @Field('password') String password,
    @Field('mobileCountryCode') String mobileCountryCode,
    @Field('mobileNumber') String mobileNumber,
    @Field('email') String email,
    @Field('profilePicture') String profilePicture,
  );

  @GET('/home')
  Future<HomeResponse> getHomeData();

  @GET('/storeDetailes/1')
  Future<StoreDetailesResponse> getStoreDetailesData();
}
