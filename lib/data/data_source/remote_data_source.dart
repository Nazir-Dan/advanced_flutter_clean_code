import 'package:advanced_flutter_tut/data/network/app_api.dart';
import 'package:advanced_flutter_tut/data/network/requestes.dart';
import 'package:advanced_flutter_tut/data/response/responces.dart';

abstract class RemoteDataSource {
  Future<AuthenticatioResponse> login(LoginRequestes loginRequestes);
  Future<AuthenticatioResponse> register(RegisterRequestes registerRequestes);
  Future<ForgotPasswordResponse> resetPassword(String email);
  Future<HomeResponse> getHomeData();
  Future<StoreDetailesResponse> getStoreDetailesData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticatioResponse> login(LoginRequestes loginRequestes) async {
    return await _appServiceClient.login(
        loginRequestes.email, loginRequestes.password);
  }

  @override
  Future<ForgotPasswordResponse> resetPassword(String email) async {
    return await _appServiceClient.resetPassword(email);
  }

  @override
  Future<AuthenticatioResponse> register(
      RegisterRequestes registerRequestes) async {
    return await _appServiceClient.register(
        registerRequestes.userName,
        registerRequestes.password,
        registerRequestes.mobileCountryCode,
        registerRequestes.mobileNumber,
        registerRequestes.email,
        '');
  }

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appServiceClient.getHomeData();
  }

  @override
  Future<StoreDetailesResponse> getStoreDetailesData() async {
    return await _appServiceClient.getStoreDetailesData();
  }
}
