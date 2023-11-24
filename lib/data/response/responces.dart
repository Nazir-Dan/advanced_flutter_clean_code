import 'package:json_annotation/json_annotation.dart';

part 'responces.g.dart';

@JsonSerializable()
class BaseResponce {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponce {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;
  CustomerResponce(this.id, this.name, this.numOfNotification);

  //from Json
  factory CustomerResponce.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponceFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$CustomerResponceToJson(this);
}

@JsonSerializable()
class ContactResponce {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactResponce(this.phone, this.email, this.link);

  //from Json
  factory ContactResponce.fromJson(Map<String, dynamic> json) =>
      _$ContactResponceFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$ContactResponceToJson(this);
}

@JsonSerializable()
class AuthenticatioResponse extends BaseResponce {
  @JsonKey(name: "customer")
  CustomerResponce? customer;
  @JsonKey(name: "contact")
  ContactResponce? contact;
  AuthenticatioResponse(this.customer, this.contact);

  //from Json
  factory AuthenticatioResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatioResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$AuthenticatioResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponce {
  @JsonKey(name: "support")
  String? support;

  ForgotPasswordResponse(this.support);

  //from Json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class ServicesResponse extends BaseResponce {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  ServicesResponse(this.id, this.title, this.image);

  //from Json
  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}

@JsonSerializable()
class BannersResponse extends BaseResponce {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "link")
  String? link;

  BannersResponse(this.id, this.title, this.image, this.link);

  //from Json
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class StoresResponse extends BaseResponce {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  StoresResponse(this.id, this.title, this.image);

  //from Json
  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse extends BaseResponce {
  @JsonKey(name: "services")
  List<ServicesResponse>? services;
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;
  @JsonKey(name: "stores")
  List<StoresResponse>? stores;

  HomeDataResponse(this.services, this.banners, this.stores);
  //from Json
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponce {
  @JsonKey(name: "data")
  HomeDataResponse? data;
  HomeResponse(this.data);
  //from Json
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class StoreDetailesResponse extends BaseResponce {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "details")
  String? details;
  @JsonKey(name: "services")
  String? services;
  @JsonKey(name: "about")
  String? about;

  StoreDetailesResponse(
      this.id, this.image, this.title, this.details, this.services, this.about);

  //from Json
  factory StoreDetailesResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailesResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$StoreDetailesResponseToJson(this);
}
