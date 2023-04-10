import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

enum ThemeType { light, dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  late bool isDark;
  late Color background;
  late Color white;
  late Color surface;
  late Color bg2;
  late Color primary;
  late Color primaryVariant;
  late Color secondary;
  late Color secondaryVariant;
  late Color accent;
  late Color grey;
  late Color greyStrong;
  late Color greyWeak;
  late Color textColor1;
  late Color textColor2;
  late Color error;
  late Color focus;
  late Color greenButton;
  late Color redButton;
  late Color txt;
  late Color accentTxt;
  late Color glassWhite;
  late Color greyTextFieldFill;
  late Color black;
  late Color weakBlack;
  late Color cyan;
  late Color fillColor;
  late Color borderColor;
  late Color pinTextColor;
  late Color blue;
  late Color dividerColor;
  late Color chatFieldBorder;
  AppTheme(this.isDark) {
    txt = isDark ? Colors.white : const Color(0xFF0A0A0A);
    accentTxt = Colors.white;
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(false)
          ..background = const Color(0xffF3F6FA)
          ..white = Colors.white
          ..bg2 = const Color(0xffF6F7FA)
          ..fillColor = const Color(0xffeaedf8)
          ..textColor1 = const Color(0xff1C0142)
          ..textColor2 = const Color(0xff140031)
          ..surface = Colors.white
          ..borderColor = const Color.fromRGBO(234, 239, 243, 1)
          ..weakBlack = const Color(0xff23262B)
          ..cyan = Colors.cyan
          ..chatFieldBorder = const Color(0xffAEB2C9)
          ..dividerColor = const Color(0xffEDF1F5)
          ..pinTextColor = const Color.fromRGBO(30, 60, 87, 1)
          ..primary = const Color(0xFFFF0000)
          ..primaryVariant = const Color(0xB5ECA2A2)
          ..secondary = const Color(0xFF3CEF6A)
          ..secondaryVariant = const Color(0xffFFCF44)
          ..accent = const Color(0xffB15DFF)
          ..greyWeak = const Color(0xff8B929E)
          ..grey = const Color(0xff515d5a)
          ..black = const Color(0xFF0A0A0A)
          ..greyStrong = const Color(0xff151918)
          ..error = Colors.redAccent
          ..redButton = const Color(0xffF97A60)
          ..blue = const Color(0xFF1D43FE)
          ..greenButton = const Color(0xff249C29)
          ..glassWhite = const Color(0x5affffff)
          ..greyTextFieldFill = const Color(0xffD9D9D9)
          ..focus = const Color(0xFF0ee2b1);

      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  ThemeData get themeData {
    ThemeData t = ThemeData.from(
      useMaterial3: true,
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: primaryVariant,
        secondary: secondary,
        secondaryContainer:
            ColorHelper.getMaterialColorFromColor(secondaryVariant),
        background: background,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: greyWeak,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }
}
