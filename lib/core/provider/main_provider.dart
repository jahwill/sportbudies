import 'package:sportbudies/export.dart';

class MainProvider extends BaseProvider {
  int _navIndex = 0;
  int get navIndex => _navIndex;
  set navIndex(int val) {
    _navIndex = val;
    notifyListeners();
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int val) {
    _tabIndex = val;
    notifyListeners();
  }

  int _walletIndex = 0;
  int get walletIndex => _walletIndex;
  set walletIndex(int val) {
    _walletIndex = val;
    notifyListeners();
  }

  bool _showWallet = true;
  bool get showWallet => _showWallet;
  set showWallet(bool state) {
    _showWallet = state;
    notifyListeners();
  }
}
