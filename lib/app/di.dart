import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/data/data_source/local_data_source.dart';
import 'package:advanced_flutter_tut/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_tut/data/network/app_api.dart';
import 'package:advanced_flutter_tut/data/network/dio_factory.dart';
import 'package:advanced_flutter_tut/data/network/netowrk_info.dart';
import 'package:advanced_flutter_tut/data/repository/repository_implementer.dart';
import 'package:advanced_flutter_tut/domain/repository/repository.dart';
import 'package:advanced_flutter_tut/domain/usecase/forgot_password_usecase.dart';
import 'package:advanced_flutter_tut/domain/usecase/home_usecase.dart';
import 'package:advanced_flutter_tut/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_tut/domain/usecase/register_usecase.dart';
import 'package:advanced_flutter_tut/domain/usecase/store_detailes_usecase.dart';
import 'package:advanced_flutter_tut/presentation/forgot_password/veiwmodel/forgot_password_veiwmodel.dart';
import 'package:advanced_flutter_tut/presentation/login/veiwmodel/login_veiwmodel.dart';
import 'package:advanced_flutter_tut/presentation/main/pages/home/view_model/home_view_model.dart';
import 'package:advanced_flutter_tut/presentation/register/view_model/register_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/store_details/view_model/store_detailes_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, it's a module where wew put all generic dependencies

  //shared prefs instance
  final sharedPreferences = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //app prefs instance
  instance
      .registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));

  // netowrk info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance<AppServiceClient>()),
  );

  //local data source
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementer(instance(), instance(), instance()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ResetPasswordVeiwModel>(
        () => ResetPasswordVeiwModel(instance()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

void initStoreDetailesModule() {
  if (!GetIt.I.isRegistered<StoreDetailesUseCase>()) {
    instance.registerFactory<StoreDetailesUseCase>(
        () => StoreDetailesUseCase(instance()));
    instance.registerFactory<StoreDetailesViewModel>(
        () => StoreDetailesViewModel(instance()));
  }
}
