import 'package:sportbudies/export.dart';

class ProfileProvider extends BaseProvider {
  ProfileModel _profileDto = ProfileModel.init();
  ProfileModel get profileDto => _profileDto;
  set profileDto(ProfileModel value) {
    _profileDto = value;
    notifyListeners();
  }

  int _navIndex = 0;
  int get navIndex => _navIndex;
  set navIndex(int val) {
    _navIndex = val;
    notifyListeners();
  }
}
