import "package:flutter/material.dart";
import 'package:sportbudies/export.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton(
      {Key? key,
      this.onPressed,
      this.icon,
      this.assetPath,
      this.size = 25.0,
      this.bgColor,
      this.iconColor,
      this.borderColor,
      this.radiusBorder,
      this.iconSize,
      this.isSVG = false})
      : super(key: key);

  final VoidCallback? onPressed;
  final IconData? icon;
  final String? assetPath;
  final bool isSVG;
  final double size;
  final double? iconSize, radiusBorder;
  final Color? bgColor, iconColor, borderColor;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return CustomContainer(
      height: size,
      width: size,
      color: bgColor ?? theme.secondary,
      border: Border.all(color: borderColor ?? Colors.transparent),
      borderRadius: BorderRadius.circular(radiusBorder ?? 10),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: isSVG
            ? Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(assetPath!),
              )
            : Icon(
                icon ?? FeatherIcons.chevronLeft,
                color: iconColor ?? Colors.black,
                size: iconSize ?? (size / 1.5),
              ),
      ),
    );
  }
}
