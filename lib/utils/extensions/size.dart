import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

extension SizedContext on BuildContext {
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  Future<T?> push<T>(Widget page) => Navigator.push<T>(
        this,
        RouteHelper.fadeThrough(() => page),
      );

  Future<T?> replace<T>(Widget page) => Navigator.pushReplacement(
        this,
        RouteHelper.fadeThrough(() => page),
      );

  Future<T?> pushOff<T>(Widget page) => Navigator.pushAndRemoveUntil<T>(
        this,
        RouteHelper.fadeThrough(
          () => page,
        ),
        (_) => false,
      );

  void popOff([String? routeTag]) => Navigator.popUntil(
      this, ModalRoute.withName(routeTag ?? '/AppScaffoldPage'));

  Future<bool> pop<T>([T? result]) => Navigator.maybePop(this, result);

  void showInAppNotification(
    String msg, {
    InAppNotificationType type = InAppNotificationType.error,
    int duration = 3,
  }) {
    late Color color;
    switch (type) {
      case InAppNotificationType.success:
        color = Colors.green;
        break;
      case InAppNotificationType.info:
        color = Colors.orange;
        break;
      case InAppNotificationType.error:
        color = Colors.redAccent;
        break;
      default:
        throw ("Unknown InAppNotificationType");
    }
    R.N.notifyKey.currentState?.show(
      child: Container(
        decoration: BoxDecoration(color: color),
        padding: EdgeInsets.fromLTRB(
          Insets.m,
          Platform.isAndroid ? 36 : 50,
          Insets.m,
          Insets.m,
        ),
        margin: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                msg,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: duration),
    );
  }
}
