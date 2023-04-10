import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportbudies/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {this.title,
      this.leading = true,
      this.trailing,
      this.leadingIcon,
      this.leadingIconColor,
      this.leadingWidth = 65.0,
      this.elevation,
      this.onTapLeadingIcon,
      this.titleColor,
      this.backGroundColor,
      this.titleWidget,
      this.appBarSize = 50.0,
      this.statusBarIconBrightness = Brightness.dark,
      Key? key})
      : super(key: key);
  final String? title;
  final List<Widget>? trailing;
  final bool leading;
  final Widget? leadingIcon;
  final double appBarSize;
  final double? leadingWidth;
  final double? elevation;
  final Color? leadingIconColor, titleColor, backGroundColor;
  final VoidCallback? onTapLeadingIcon;
  final Widget? titleWidget;
  final Brightness statusBarIconBrightness;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return AppBar(
      leading: leading
          ? InkWell(
              highlightColor: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(Corners.s8),
              onTap: onTapLeadingIcon ?? () => Navigator.pop(context),
              child: leadingIcon != null
                  ? Row(
                      children: [
                        leadingIcon ?? const SizedBox.shrink(),
                      ],
                    )
                  : Row(
                      children: [
                        const HSpace(24),
                        AppBackButton(
                          size: 40,
                          radiusBorder: 12,
                          iconSize: 14,
                          icon: Icons.arrow_back_ios_new_rounded,
                          borderColor: theme.greyStrong,
                          bgColor: Colors.transparent,
                        ),
                      ],
                    ),
            )
          : const SizedBox.shrink(),
      title: titleWidget ??
          (StringHelper.isEmpty(title)
              ? null
              : Text(title ?? '',
                  style: TextStyles.h5.semiBold
                      .copyWith(color: titleColor ?? Colors.black))),
      actions: trailing ?? [],
      backgroundColor: backGroundColor ?? theme.surface,
      elevation: elevation ?? 0,
      leadingWidth: leadingWidth,
      toolbarHeight: appBarSize - 5,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarColor: backGroundColor ?? theme.surface,
        systemStatusBarContrastEnforced: true,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarSize);
}
