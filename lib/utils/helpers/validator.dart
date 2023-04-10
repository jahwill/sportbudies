import 'package:sportbudies/export.dart';

class Validator {
  const Validator();

  static String? Function(String?) phone({int maxLength = 10}) {
    return (String? value) {
      value = harmonize(value);
      final regex = RegExp(r"^[0-9]");
      if (value.isEmpty || !regex.hasMatch(value)) {
        return "please enter a valid phone number";
      }
      if (value.length < maxLength || value.length > maxLength) {
        return " must be $maxLength characters digits";
      }
      return null;
    };
  }

  static String? Function(String?) numeric({int? maxLength = 10}) {
    return (String? value) {
      value = harmonize(value);
      final regex = RegExp(r"^[0-9]");
      if (value.isEmpty || !regex.hasMatch(value)) {
        return "Enter a valid number";
      }
      if (maxLength != null) {
        if (value.length > maxLength || value.length < maxLength) {
          return "Must be $maxLength characters digits";
        } else {
          return null;
        }
      }
      return null;
    };
  }

  static String bvn(String? value) {
    final regex = RegExp(r"^\d{11}$");
    value = harmonize(value);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return "please enter a valid bvn number";
    }
    return '';
  }

  static String? email(String? value) {
    const Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(emailPattern.toString());
    value = harmonize(value);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? Function(String?) string(
      {int minLength = 1, int? maxLength, String? error}) {
    return (String? value) {
      value = harmonize(value);

      if (value.isEmpty && value.length < minLength) {
        return error ?? "Field is required.";
      }

      if (maxLength != null) {
        if (minLength == maxLength && value.length != minLength) {
          return "Field must be $minLength characters";
        }
        if (value.length < minLength || value.length > maxLength) {
          return "Field must be $minLength-$maxLength characters";
        }
      }
      if (value.length < minLength) {
        return "Field must have a minimum of $minLength characters";
      }
      if (maxLength != null && value.length < maxLength) {
        return "Field must not have more than $maxLength characters";
      }
      return null;
    };
  }

  static String date(String? value) {
    const error = "Field must be a valid date";
    value = harmonize(value);
    if (value.isEmpty) {
      return "Field is required.";
    }
    if (value.length != 10) {
      return error;
    }
    final day = value.substring(0, 2).toInt();
    final month = value.substring(3, 5).toInt();
    final year = value.substring(6, 10).toInt();
    if (day == -1 ||
        month == -1 ||
        year == -1 ||
        day > 31 ||
        month > 12 ||
        year < 1900) {
      return error;
    }
    return '';
  }

  static String? Function(String?) password({int minLength = 8}) {
    return (String? value) {
      value = harmonize(value);

      if (value.isEmpty) {
        return "Password is required";
      }
      if (value.length < minLength) {
        return "Password must be at least $minLength characters";
      }
      return null;
    };
  }

  static String? Function(String?) confirmPwd(
      {String? password, String? error, int minLength = 8}) {
    // print(password);
    return (String? value) {
      value = harmonize(value);

      if (value.isEmpty) {
        return "Password is required";
      }
      if (value.length < minLength) {
        return "Password must be at least $minLength characters";
      }
      if (value != password) {
        return error ?? "Passwords do not match";
      }
      return null;
    };
  }

  static String? Function(String?) amount([double? minAmount, String? error]) {
    return (String? value) {
      value = harmonize(value);
      if (value.isEmpty) {
        return error ?? "Amount is required.";
      }

      final amount = double.tryParse(value);
      if (amount == null) {
        return error ?? "Invalid Amount.";
      }

      if (minAmount != null && amount < minAmount) {
        return error ?? "Amount can't be less than ${minAmount.toInt()}";
      }

      return null;
    };
  }

  static String harmonize(String? value) =>
      value == null ? "" : value.replaceAll(",", "").trim();
}

enum InputType { txt, date, money, tel, pwd, num, email }

/*  static bool isEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  static bool text(String? s) => s == null || s.trim().isEmpty;

  static bool email(String? value) {
    if (value == null) return false;
    RegExp emailRegExp =
        RegExp(r"(^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$)");
    return emailRegExp.hasMatch(value);
  }

  static bool phone(String? value) {
    if (value == null) return false;
    RegExp telRegExp = RegExp(r"(^[\+]?[234]\d{12}$)");
    //(^(1\s?)?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{4}$)
    return telRegExp.hasMatch(value);
  }

  static bool pwd(String? password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }*/
