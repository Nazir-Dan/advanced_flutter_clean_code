// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponce _$BaseResponceFromJson(Map<String, dynamic> json) => BaseResponce()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponceToJson(BaseResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['numOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotification': instance.numOfNotification,
    };

ContactResponce _$ContactResponceFromJson(Map<String, dynamic> json) =>
    ContactResponce(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponceToJson(ContactResponce instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticatioResponse _$AuthenticatioResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticatioResponse(
      json['customer'] == null
          ? null
          : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
      json['contact'] == null
          ? null
          : ContactResponce.fromJson(json['contact'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticatioResponseToJson(
        AuthenticatioResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contact': instance.contact,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['support'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'support': instance.support,
    };

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) =>
    ServicesResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ServicesResponseToJson(ServicesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['link'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
    };

StoresResponse _$StoresResponseFromJson(Map<String, dynamic> json) =>
    StoresResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$StoresResponseToJson(StoresResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['services'] as List<dynamic>?)
          ?.map((e) => ServicesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stores'] as List<dynamic>?)
          ?.map((e) => StoresResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'services': instance.services,
      'banners': instance.banners,
      'stores': instance.stores,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

StoreDetailesResponse _$StoreDetailesResponseFromJson(
        Map<String, dynamic> json) =>
    StoreDetailesResponse(
      json['id'] as int?,
      json['image'] as String?,
      json['title'] as String?,
      json['details'] as String?,
      json['services'] as String?,
      json['about'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$StoreDetailesResponseToJson(
        StoreDetailesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'details': instance.details,
      'services': instance.services,
      'about': instance.about,
    };
