import 'package:sportbudies/export.dart';

abstract class BaseService {
  Future createAccount(SignUpModel signUpModel);
  Future createUserProfile(ProfileModel profileModel, User? user);
  Future login(LoginModel model);
  Future<void> changePassword(
      {required String email,
      required String password,
      required String newPassword});
  Future<User?> initializeFlutterFire();
  Future<void> logout();
  Future<bool> sendMailVerification(User? user);
  Future<bool> isUserEmailVerified(User? user);
  Future<String> resetUserPassword(String email);
}
