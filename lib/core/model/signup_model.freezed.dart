// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return _SignUpModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpModel {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get password_confirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpModelCopyWith<SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(
          SignUpModel value, $Res Function(SignUpModel) then) =
      _$SignUpModelCopyWithImpl<$Res, SignUpModel>;
  @useResult
  $Res call(
      {String phoneNumber,
      String email,
      String password,
      String password_confirmation});
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res, $Val extends SignUpModel>
    implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
    Object? password_confirmation = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      password_confirmation: null == password_confirmation
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpModelCopyWith<$Res>
    implements $SignUpModelCopyWith<$Res> {
  factory _$$_SignUpModelCopyWith(
          _$_SignUpModel value, $Res Function(_$_SignUpModel) then) =
      __$$_SignUpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String email,
      String password,
      String password_confirmation});
}

/// @nodoc
class __$$_SignUpModelCopyWithImpl<$Res>
    extends _$SignUpModelCopyWithImpl<$Res, _$_SignUpModel>
    implements _$$_SignUpModelCopyWith<$Res> {
  __$$_SignUpModelCopyWithImpl(
      _$_SignUpModel _value, $Res Function(_$_SignUpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
    Object? password_confirmation = null,
  }) {
    return _then(_$_SignUpModel(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      password_confirmation: null == password_confirmation
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpModel with DiagnosticableTreeMixin implements _SignUpModel {
  const _$_SignUpModel(
      {this.phoneNumber = '',
      this.email = '',
      this.password = '',
      this.password_confirmation = ''});

  factory _$_SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpModelFromJson(json);

  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String password_confirmation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpModel(phoneNumber: $phoneNumber, email: $email, password: $password, password_confirmation: $password_confirmation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpModel'))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(
          DiagnosticsProperty('password_confirmation', password_confirmation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpModel &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.password_confirmation, password_confirmation) ||
                other.password_confirmation == password_confirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, phoneNumber, email, password, password_confirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpModelCopyWith<_$_SignUpModel> get copyWith =>
      __$$_SignUpModelCopyWithImpl<_$_SignUpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpModelToJson(
      this,
    );
  }
}

abstract class _SignUpModel implements SignUpModel {
  const factory _SignUpModel(
      {final String phoneNumber,
      final String email,
      final String password,
      final String password_confirmation}) = _$_SignUpModel;

  factory _SignUpModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpModel.fromJson;

  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  String get password_confirmation;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpModelCopyWith<_$_SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
