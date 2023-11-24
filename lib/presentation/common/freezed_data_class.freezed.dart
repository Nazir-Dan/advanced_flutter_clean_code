// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get Password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String Password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? Password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String Password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? Password = null,
  }) {
    return _then(_$_LoginObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.Password);

  @override
  final String userName;
  @override
  final String Password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, Password: $Password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.Password, Password) ||
                other.Password == Password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, Password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String Password) =
      _$_LoginObject;

  @override
  String get userName;
  @override
  String get Password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get mobileCountryCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String userName,
      String password,
      String mobileCountryCode,
      String mobileNumber,
      String email,
      String profilePicture});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? mobileCountryCode = null,
    Object? mobileNumber = null,
    Object? email = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileCountryCode: null == mobileCountryCode
          ? _value.mobileCountryCode
          : mobileCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String password,
      String mobileCountryCode,
      String mobileNumber,
      String email,
      String profilePicture});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$_RegisterObject>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? mobileCountryCode = null,
    Object? mobileNumber = null,
    Object? email = null,
    Object? profilePicture = null,
  }) {
    return _then(_$_RegisterObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileCountryCode
          ? _value.mobileCountryCode
          : mobileCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.userName, this.password, this.mobileCountryCode,
      this.mobileNumber, this.email, this.profilePicture);

  @override
  final String userName;
  @override
  final String password;
  @override
  final String mobileCountryCode;
  @override
  final String mobileNumber;
  @override
  final String email;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'RegisterObject(userName: $userName, password: $password, mobileCountryCode: $mobileCountryCode, mobileNumber: $mobileNumber, email: $email, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.mobileCountryCode, mobileCountryCode) ||
                other.mobileCountryCode == mobileCountryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password,
      mobileCountryCode, mobileNumber, email, profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String userName,
      final String password,
      final String mobileCountryCode,
      final String mobileNumber,
      final String email,
      final String profilePicture) = _$_RegisterObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  String get mobileCountryCode;
  @override
  String get mobileNumber;
  @override
  String get email;
  @override
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeViewObject {
  List<BannerAdd> get banners => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  List<Store> get stores => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewObjectCopyWith<HomeViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewObjectCopyWith<$Res> {
  factory $HomeViewObjectCopyWith(
          HomeViewObject value, $Res Function(HomeViewObject) then) =
      _$HomeViewObjectCopyWithImpl<$Res, HomeViewObject>;
  @useResult
  $Res call(
      {List<BannerAdd> banners, List<Service> services, List<Store> stores});
}

/// @nodoc
class _$HomeViewObjectCopyWithImpl<$Res, $Val extends HomeViewObject>
    implements $HomeViewObjectCopyWith<$Res> {
  _$HomeViewObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? services = null,
    Object? stores = null,
  }) {
    return _then(_value.copyWith(
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerAdd>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeViewObjectCopyWith<$Res>
    implements $HomeViewObjectCopyWith<$Res> {
  factory _$$_HomeViewObjectCopyWith(
          _$_HomeViewObject value, $Res Function(_$_HomeViewObject) then) =
      __$$_HomeViewObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BannerAdd> banners, List<Service> services, List<Store> stores});
}

/// @nodoc
class __$$_HomeViewObjectCopyWithImpl<$Res>
    extends _$HomeViewObjectCopyWithImpl<$Res, _$_HomeViewObject>
    implements _$$_HomeViewObjectCopyWith<$Res> {
  __$$_HomeViewObjectCopyWithImpl(
      _$_HomeViewObject _value, $Res Function(_$_HomeViewObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? services = null,
    Object? stores = null,
  }) {
    return _then(_$_HomeViewObject(
      null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerAdd>,
      null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
    ));
  }
}

/// @nodoc

class _$_HomeViewObject implements _HomeViewObject {
  _$_HomeViewObject(final List<BannerAdd> banners, final List<Service> services,
      final List<Store> stores)
      : _banners = banners,
        _services = services,
        _stores = stores;

  final List<BannerAdd> _banners;
  @override
  List<BannerAdd> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<Store> _stores;
  @override
  List<Store> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  @override
  String toString() {
    return 'HomeViewObject(banners: $banners, services: $services, stores: $stores)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeViewObject &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._stores, _stores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_stores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeViewObjectCopyWith<_$_HomeViewObject> get copyWith =>
      __$$_HomeViewObjectCopyWithImpl<_$_HomeViewObject>(this, _$identity);
}

abstract class _HomeViewObject implements HomeViewObject {
  factory _HomeViewObject(
      final List<BannerAdd> banners,
      final List<Service> services,
      final List<Store> stores) = _$_HomeViewObject;

  @override
  List<BannerAdd> get banners;
  @override
  List<Service> get services;
  @override
  List<Store> get stores;
  @override
  @JsonKey(ignore: true)
  _$$_HomeViewObjectCopyWith<_$_HomeViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}
