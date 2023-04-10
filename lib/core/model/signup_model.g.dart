// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpModel _$$_SignUpModelFromJson(Map<String, dynamic> json) =>
    _$_SignUpModel(
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      password_confirmation: json['password_confirmation'] as String? ?? '',
    );

Map<String, dynamic> _$$_SignUpModelToJson(_$_SignUpModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
    };
