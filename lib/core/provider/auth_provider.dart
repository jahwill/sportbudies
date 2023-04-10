import 'package:sportbudies/export.dart';

class AuthProvider extends BaseProvider {
  // UserModel _user = UserModel.init();
  // // String _user = '';
  //
  // UserModel get user => _user;
  //
  // set setUser(Map<String, dynamic> userObject) {
  //   _user = UserModel.fromJson(userObject);
  //   notifyListeners();
  // }

  String _token = '';

  String get token => _token;
  set setUserToken(String val) {
    _token = val;
    notifyListeners();
  }

  SignUpModel _signupDto = SignUpModel.init();
  SignUpModel get signupDto => _signupDto;
  set signupDto(SignUpModel value) {
    _signupDto = value;
    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  set setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
