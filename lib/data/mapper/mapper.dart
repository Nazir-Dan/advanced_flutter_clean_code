import 'package:advanced_flutter_tut/app/constants.dart';
import 'package:advanced_flutter_tut/app/extensions.dart';
import 'package:advanced_flutter_tut/data/response/responces.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponce? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotification.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactResponce? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticatioResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contact.toDomain(),
    );
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}

extension ServicesResponseMapper on ServicesResponse? {
  Service toDomain() {
    return Service(
        this?.id?.orZero() ?? Constants.zero,
        this?.title?.orEmpty() ?? Constants.empty,
        this?.image?.orEmpty() ?? Constants.empty);
  }
}

extension StoresResponseMapper on StoresResponse? {
  Store toDomain() {
    return Store(
        this?.id?.orZero() ?? Constants.zero,
        this?.title?.orEmpty() ?? Constants.empty,
        this?.image?.orEmpty() ?? Constants.empty);
  }
}

extension BannersResponseMapper on BannersResponse? {
  BannerAdd toDomain() {
    return BannerAdd(
      this?.id?.orZero() ?? Constants.zero,
      this?.title?.orEmpty() ?? Constants.empty,
      this?.image?.orEmpty() ?? Constants.empty,
      this?.link?.orEmpty() ?? Constants.empty,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
            ?.data
            ?.services
            ?.map((servicesResponse) => servicesResponse.toDomain())
            .toList() ??
        <Service>[]);
    List<BannerAdd> banners = (this
            ?.data
            ?.banners
            ?.map((servicesResponse) => servicesResponse.toDomain())
            .toList() ??
        []);
    List<Store> stores = (this
            ?.data
            ?.stores
            ?.map((servicesResponse) => servicesResponse.toDomain())
            .toList() ??
        []);
    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}

extension StoreDetailesMapper on StoreDetailesResponse? {
  StoreDetailesObject toDomain() {
    return StoreDetailesObject(
      this?.id?.orZero() ?? Constants.zero,
      this?.image?.orEmpty() ?? Constants.empty,
      this?.title?.orEmpty() ?? Constants.empty,
      this?.details?.orEmpty() ?? Constants.empty,
      this?.services?.orEmpty() ?? Constants.empty,
      this?.about?.orEmpty() ?? Constants.empty,
    );
  }
}
