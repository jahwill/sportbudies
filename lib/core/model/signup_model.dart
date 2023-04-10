import 'package:sportbudies/export.dart';

part 'signup_model.freezed.dart';
part 'signup_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String password,
    @Default('') String password_confirmation,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  static SignUpModel init() {
    return const SignUpModel(
      email: "",
      password: "",
    );
  }
}
