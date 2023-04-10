import 'package:sportbudies/export.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);

  static LoginModel init() {
    return const LoginModel(
      email: '',
      password: '',
    );
  }
}
