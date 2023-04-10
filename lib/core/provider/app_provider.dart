import 'package:sportbudies/export.dart';

import 'base_provider.dart';

class AppProvider extends BaseProvider {
  ThemeType _theme = ThemeType.light;
  ThemeType get theme => _theme;
  set theme(ThemeType val) {
    _theme = val;
    notifyListeners();
  }

  int get currentPage => _currentPage;
  int _currentPage = 0;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int _onBoardPageIndex = 0;
  int get onBoardPageIndex => _onBoardPageIndex;
  set setOnBoardPageIndex(int val) {
    _onBoardPageIndex = val;
    notifyListeners();
  }
}
