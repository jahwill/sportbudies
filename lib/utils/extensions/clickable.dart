import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

extension ClickableExtensions on Widget {
  Widget clickable(void Function()? action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: action,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: opaque,
        child: this,
      ),
    );
  }

  Widget rippleClick(void Function()? onTap) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: this,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: Corners.s8Border,
              ),
              padding: EdgeInsets.symmetric(horizontal: Insets.m),
            ),
            onPressed: onTap,
            child: Container(),
          ),
        ),
      ],
    );
  }
}
