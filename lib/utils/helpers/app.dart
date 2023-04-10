import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sportbudies/export.dart';

class AppHelper {
  static void getFutureSizeFromGlobalKey(
      GlobalKey key, Function(Size size) callback) {
    Future.microtask(() {
      Size? size = getSizeFromContext(key.currentContext);
      if (size != null) {
        callback(size);
      }
    });
  }

  static Size? getSizeFromContext(BuildContext? context) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.size;
  }

  static Offset getOffsetFromContext(BuildContext? context, [Offset? offset]) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.localToGlobal(offset ?? Offset.zero);
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool get isMouseConnected =>
      RendererBinding.instance.mouseTracker.mouseIsConnected;

  static void unFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static String getDevice() {
    if (Platform.isAndroid) {
      return "mobile";
    } else if (Platform.isMacOS) {
      return "laptop";
    } else if (Platform.isFuchsia) {
      return "mobile";
    } else if (Platform.isLinux) {
      return "laptop";
    } else if (Platform.isWindows) {
      return "laptop";
    } else {
      return "laptop";
    }
  }

  ///snack bar message to be displayed
  static void standardPrintedMessage(BuildContext context, String message,
      {Color? color,
      duration = 4,
      Color? bgColor,
      double? marginFromBottom,
      String? alertTitle,
      String msgType = 'ERROR'}) {
//determine type of message then set background color accordingly
    Color colorBg = Colors.transparent.withOpacity(0.89);
    String title = 'Alert !';
    if (msgType == 'ERROR') {
      colorBg = Colors.red.shade800;
      title = alertTitle ?? 'Ooh !';
    } else if (msgType == 'SUCCESS') {
      colorBg = Colors.green;
      title = alertTitle ?? 'Yeah!';
    } else {
      colorBg = Colors.transparent.withOpacity(0.89);
    }

    ///
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      duration: Duration(seconds: duration),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 130),
            decoration: BoxDecoration(
                color: colorBg, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Row(
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: color ?? Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          message,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: color ?? Colors.white),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: -8.0,
              left: -8.0,
              child: Icon(
                Icons.bubble_chart_sharp,
                size: 55,
                color: Theme.of(context).primaryColor,
              )),
          Positioned(
              bottom: -10,
              left: -8.0,
              child: Icon(
                Icons.bubble_chart_sharp,
                size: 65,
                color: Theme.of(context).primaryColor,
              )),
          Positioned(
              top: -20,
              left: -10,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Material(
                  color: Colors.transparent,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: colorBg.withOpacity(0.5),
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                            size: 28,
                          )),
                    ),
                  ),
                ),
              )),
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}

safePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

/// get a unique random string id at call
// String getRandomUID() {
//   var uuid = const Uuid();
//   return uuid.v4();
// }

class Generator {
  static String generateString({
    String character = '*',
    int amountToGenerate = 4,
    String? str,
  }) {
    List<String> generatedAsterisks = [];
    for (int i = 0; i < (str?.length ?? amountToGenerate); i++) {
      generatedAsterisks.add(character);
    }
    log(str ?? "no String to display");
    return generatedAsterisks.join(" ");
  }
}

///timer class
class TimerBlc {
  int _counter = 0;
  get counter => _counter;

  set setCounter(count) {
    _counter = count;
  }

  ///timer
  setTimeOutPeriodic(Duration howOften,
      {Function? callback, bool endTimer = false}) {
    Timer.periodic(
        howOften,
        callback == null
            ? (time) {
                setCounter = time.tick;
                if (endTimer) {
                  time.cancel();
                } else {
                  null;
                }
              }
            : (time) {
                callback(time.tick);

                setCounter = time.tick;
                if (endTimer) {
                  time.cancel();
                } else {
                  null;
                }
              });
  }

  ///timer
  timerCounter(Duration howOften,
      {Function? callback, bool endTimer = false, Duration? timeToEndTime}) {
    Timer.periodic(
        howOften,
        callback == null
            ? (time) {
                time.cancel();
                log('please provide a call back function to access the figures');
              }
            : (time) {
                callback(time.tick);

                if (timeToEndTime != null) {
                  Future.delayed(timeToEndTime, () {
                    time.cancel();
                  });
                }
                if (endTimer) {
                  time.cancel();
                } else {
                  null;
                }
              });
  }
}
