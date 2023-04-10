import 'package:sportbudies/export.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String username,
    @Default('') String email,
    @Default('') String bio,
    @Default('') String dob,
    @Default('') String gender,
    @Default('') String phone,
    @Default([]) List<String> interest,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);

  static ProfileModel init() {
    return ProfileModel(
        username: '',
        bio: '',
        email: '',
        dob: '',
        gender: '',
        firstName: '',
        lastName: '',
        phone: '',
        interest: []);
  }
}
