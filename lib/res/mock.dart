import 'package:sportbudies/export.dart';

class Mock {
  String get userName => 'Janet Jackson';

  static List<Map<String, dynamic>> navItems = [
    {"icon": R.I.profile.svg, "label": "Profile", 'setIndex': 0},
    {"icon": R.I.buddies.svg, "label": "Buddies", 'setIndex': 1},
    {"icon": R.I.search.svg, "label": "Discover", 'setIndex': 2},
    {"icon": R.I.settings.svg, "label": "Settings", 'setIndex': 3},
  ];

  List<String> gender = ['Female', 'Male'];
  List<String> state = ['Lagos', 'Benin', 'Kwara'];
  List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  int getMonthIndex(String monthName) {
    int index = 0;
    switch (monthName) {
      case 'January':
        index = 1;
        break;
      case 'February':
        index = 2;
        break;
      case 'March':
        index = 3;
        break;
      case 'April':
        index = 4;
        break;
      case 'May':
        index = 5;
        break;
      case 'June':
        index = 6;
        break;
      case 'July':
        index = 7;
        break;
      case 'August':
        index = 8;
        break;
      case 'September':
        index = 9;
        break;
      case 'October':
        index = 10;
        break;
      case 'November':
        index = 11;
        break;
      case 'December':
        index = 12;
        break;
    }

    return index;
  }

  List<String> interest = [
    'Football',
    'Basketball',
    'Ice Hockey',
    'Motorsports',
    'Bandy',
    'Rugby',
    'Skiing',
    'Shooting',
  ];
}
