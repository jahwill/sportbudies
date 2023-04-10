import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class SearchFilterModal extends StatelessWidget {
  const SearchFilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double constSpace = 20;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 40,
          child: Material(
            color: const Color(0xff23262B),
            borderRadius: Corners.s12Border,
            child: SizedBox(
              height: 346,
              width: 318,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: constSpace / 2, horizontal: 18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            'Filter Results for ',
                            style: TextStyles.body1.copyWith(
                                fontSize: 16,
                                color: const Color(0xff9CA5B1),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Web Development",
                            style: TextStyles.h6.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffC6CEDA)),
                          ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        'Distance',
                        style: TextStyles.body1.copyWith(
                            fontSize: 14,
                            color: const Color(0xff7C848F),
                            fontWeight: FontWeight.w400),
                      ),
                      const VSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.widthPx,
                            child: Slider(
                              value: 0.2,
                              onChanged: (v) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '4.5km',
                              style: TextStyles.body1.copyWith(
                                  fontSize: 14,
                                  color: const Color(0xffC6CEDA),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const VSpace(15.0),
                      Text(
                        'Price Range (₦)',
                        style: TextStyles.body1.copyWith(
                          fontSize: 14,
                          color: const Color(0xff9CA5B1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const VSpace(13),
                      FittedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 149,
                              child: BaseTextInput(
                                onChanged: (v) {},
                                initialValue: '',
                              ),
                            ),
                            const HSpace(12),
                            BaseTextInput(
                              onChanged: (v) {},
                              label: 'To',
                            ),
                          ],
                        ),
                      ),
                      const VSpace(32),
                      FittedBox(
                        child: Row(
                          children: const [
                            PrimaryButton(
                              label: 'CLEAR',
                            ),
                            HSpace(12),
                            PrimaryButton(
                              label: 'FILTER',
                            ),
                          ],
                        ),
                      ),
                      const VSpace(5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: CustomContainer(
              height: 40.0,
              width: 40.0,
              borderRadius: BorderRadius.circular(12),
              child: SvgPicture.asset(
                R.I.close.svg,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Offset getObjectOffset(GlobalKey key) {
    Offset offset = const Offset(0, 0);
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;

    Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      offset = Offset(position.dx, position.dy);
    }
    return offset;
  }
}

class MCustomBottomSheet {
  static Future openBottomSheet(BuildContext context, Widget child,
      {double sizeFraction = 0.45,
      String title = '',
      bool addCloseIcon = false,
      bool showDragTopICon = true,
      bool centerAlignTitle = true,
      bool isDismissible = true,
      bool enableDrag = true,
      double edgeRadius = 30,
      double closeIconHeightFromTop = 5,
      EdgeInsets? padding}) {
    return showMaterialModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent.withOpacity(0.15),
        builder: (
          BuildContext context,
        ) =>
            CustomContainer(
              height: context.heightPx * sizeFraction,
              color: const Color(0xffF3F6FA),
              shadows: Shadows.universal,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(edgeRadius),
                  topRight: Radius.circular(edgeRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDragTopICon) ...[
                    CustomContainer(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      borderRadius: Corners.s8Border,
                      color: Colors.black.withOpacity(0.2),
                    ).center()
                  ],
                  VSpace(closeIconHeightFromTop),
                  addCloseIcon
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (centerAlignTitle) ...[const SizedBox()],

                              Container(
                                child: Text(
                                  title,
                                  style: TextStyles.body2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),
                              // const Spacer(),
                              const Icon(Icons.close).rippleClick(() {
                                context.pop();
                              })
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  const VSpace(10),
                  Expanded(
                    child: Padding(
                      padding:
                          padding ?? const EdgeInsets.symmetric(horizontal: 24),
                      child: child,
                    ),
                  )
                ],
              ),
            ));
  }

  static showCustomBottomSheet(BuildContext context, Widget child,
      {double sizeFraction = 0.45,
      String title = '',
      bool addCloseIcon = false,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    scaffoldKey.currentState?.showBottomSheet(
        enableDrag: true,
        (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: CustomContainer(
                height: context.heightPx * sizeFraction,
                color: const Color(0xffF3F6FA),
                shadows: Shadows.universal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainer(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      borderRadius: Corners.s8Border,
                      color: Colors.black.withOpacity(0.2),
                    ).center(),
                    const VSpace(5),
                    addCloseIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              // const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  title,
                                  style: TextStyles.body2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),
                              // const Spacer(),
                              const Icon(Icons.close).rippleClick(() {
                                context.pop();
                              })
                            ],
                          )
                        : const SizedBox.shrink(),
                    const VSpace(10),
                    Expanded(child: child)
                  ],
                ),
              ),
            ));
  }

  static showBottomSheetWithNoScaffoldKey(
    BuildContext context,
    Widget child, {
    double sizeFraction = 0.45,
    String title = '',
    bool addCloseIcon = false,
  }) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: CustomContainer(
                height: context.heightPx * sizeFraction,
                color: const Color(0xffF3F6FA),
                shadows: Shadows.universal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainer(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      borderRadius: Corners.s8Border,
                      color: Colors.black.withOpacity(0.2),
                    ).center(),
                    const VSpace(5),
                    addCloseIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              // const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  title,
                                  style: TextStyles.body2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ).center(),
                              ),

                              const Icon(Icons.close).rippleClick(() {
                                context.pop();
                              })
                            ],
                          )
                        : const SizedBox.shrink(),
                    const VSpace(10),
                    Expanded(child: child)
                  ],
                ),
              ),
            ));
  }

  ///this one has no padding attached to it or decoration it is just a plain bottom sheet
  static showBasicBottomSheet(BuildContext context, Widget child,
      {double sizeFraction = 0.45,
      String title = '',
      double radius = 30,
      bool addCloseIcon = false,
      bool showDragTopICon = false,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    scaffoldKey.currentState?.showBottomSheet(
        enableDrag: true,
        (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SafeArea(
                child: CustomContainer(
                  height: context.heightPx * sizeFraction,
                  color: const Color(0xffF3F6FA),
                  shadows: Shadows.universal,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showDragTopICon) ...[
                        CustomContainer(
                          width: 50,
                          height: 5,
                          margin: const EdgeInsets.only(top: 10),
                          borderRadius: Corners.s8Border,
                          color: Colors.black.withOpacity(0.2),
                        ).center()
                      ],
                      const VSpace(5),
                      if (addCloseIcon) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            // const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Text(
                                title,
                                style: TextStyles.body2
                                    .copyWith(fontWeight: FontWeight.w600),
                              ).center(),
                            ),
                            // const Spacer(),
                            const Icon(Icons.close).rippleClick(() {
                              context.pop();
                            })
                          ],
                        )
                      ],
                      const VSpace(10),
                      Expanded(child: child)
                    ],
                  ),
                ),
              ),
            ));
  }
}
