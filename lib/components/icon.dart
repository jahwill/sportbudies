import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.icon, {this.size, this.color, this.isSvg = true, Key? key})
      : super(key: key);
  final String icon;
  final Color? color;
  final double? size;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return isSvg == true
        ? SvgPicture.asset(
            icon,
            color: color,
            height: size ?? Sizes.iconMed,
            width: size ?? Sizes.iconMed,
            fit: BoxFit.contain,
          )
        : SizedBox(
            height: size,
            width: size,
            child: Image.asset(
              icon.trim(),
              fit: BoxFit.cover,
            ));
  }
}
