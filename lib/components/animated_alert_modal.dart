import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class AnimatedAlertModal {
  static Future<Object?> showEmptyModal(BuildContext context,
      {String? title,
      TextStyle? titleStyle,
      Widget? body,
      String? iconPath,
      bool showIcon = true,
      double screenFraction = 0.4}) {
    bool fromTop = true;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.l,
                right: Insets.l,
                bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -45.0,
                              child: showIcon
                                  ? CircleAvatar(
                                      radius: 28,
                                      backgroundColor: const Color(0xffD9D9D9),
                                      child: iconPath == null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SvgPicture.asset(
                                                  R.I.lock.svg),
                                            )
                                          : Image.asset(iconPath),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title == null ? const SizedBox.shrink() : const VSpace(10),
                    title == null
                        ? const SizedBox.shrink()
                        : Text(
                            title,
                            textAlign: TextAlign.center,
                            style: titleStyle ??
                                TextStyles.h5.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFF1D43FE)),
                          ),
                    const VSpace(10),
                    body ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  static Future<Object?> showNetworkExceptionModal(BuildContext context,
      {String? title,
      Widget? body,
      String? iconPath,
      double screenFraction = 0.4}) {
    bool fromTop = true;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400, maxWidth: 270),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.l,
                right: Insets.l,
                bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -40.0,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: const Icon(FeatherIcons.alertOctagon),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title == null ? const SizedBox.shrink() : const VSpace(10),
                    title == null
                        ? const SizedBox.shrink()
                        : Text(
                            title,
                            style: TextStyles.h6.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey),
                          ),
                    const VSpace(20),
                    body ?? const SizedBox.shrink(),
                    const VSpace(10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  static Future<Object?> emptyModalWithNoTitle(BuildContext context,
      {String? title,
      TextStyle? titleStyle,
      Widget? body,
      String? iconPath,
      bool showIcon = true,
      Color? bgColor,
      bool fromTop = true,
      bool autoPop = true,
      Duration? closeDuration,
      double screenFraction = 0.4}) {
    bool dialogIsOpen = true;

    autoPop
        ? Future.delayed(closeDuration ?? const Duration(seconds: 3), () {
            if (dialogIsOpen == true) {
              Navigator.of(context, rootNavigator: true).pop();
            } else {
              null;
            }
          })
        : null;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.transparent.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 620),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment:
              fromTop == true ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            margin: EdgeInsets.only(
                top: context.heightPx * screenFraction,
                left: Insets.m,
                right: Insets.m,
                bottom: 50),
            decoration: BoxDecoration(
              color: bgColor ?? Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Insets.l, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    showIcon
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 20,
                              width: 40,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -45.0,
                                    child: CircleAvatar(
                                      radius: 28,
                                      child: iconPath == null
                                          ? SvgPicture.asset(R.I.lock.svg)
                                          : Image.asset(iconPath),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const VSpace(8),
                    body ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (modalContext, anim1, anim2, child) {
        // thisContext = modalContext;

        return SlideTransition(
          position: Tween(
                  begin: Offset(0, fromTop == true ? -1 : 1),
                  end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    ).then((value) {
      dialogIsOpen = false;
      // print(dialogIsOpen);
      return true;
    });
  }
}
