import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key, this.onClickContinue})
      : super(key: key);
  final Function()? onClickContinue;
  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen>
    with FormMixin {
  bool loading = false;
  bool resending = false;
  String email = '';
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0.3,
        leadingIconColor: theme.primary,
        leading: false,
        title: 'Email Verification',
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: Consumer<AuthProvider>(
            builder: (BuildContext context, store, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VSpace(150),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Verify your Email",
                      style: TextStyles.h5,
                    ),
                  ),
                  const VSpace(10.0),
                  RichText(
                    textAlign: TextAlign.center,
                    textScaleFactor: MediaQuery.textScaleFactorOf(context),
                    text: TextSpan(
                      style: TextStyles.body1.copyWith(
                          color: theme.black.withOpacity(0.5), height: 1.7),
                      children: [
                        TextSpan(
                          text: " An email verification link has been sent to ",
                        ),
                        TextSpan(
                          text: store.user?.email,
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w600, color: theme.black),
                        ),
                        const TextSpan(
                          text:
                              '. Follow the link sent to you to verify your email and come back here to continue with the app.',
                        )
                      ],
                    ),
                  ),

                  // Pinput(
                  //   onChanged: (pin) {},
                  //   length: 6,
                  //   obscureText: true,
                  //   defaultPinTheme: PinTheme(
                  //     width: 45,
                  //     height: 45,
                  //     textStyle: TextStyle(
                  //       fontSize: 20,
                  //       color: theme.pinTextColor,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       color: theme.bg2,
                  //       border: Border.all(color: theme.borderColor),
                  //       borderRadius: Corners.s10Border,
                  //     ),
                  //   ),
                  //   focusedPinTheme: PinTheme(
                  //     width: 45,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: theme.cyan),
                  //       borderRadius: Corners.s10Border,
                  //     ),
                  //   ),
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ),
                  const VSpace(50),
                  PrimaryButton(
                    onPressed: widget.onClickContinue ??
                        () {
                          context.push(const ProfileMainScreen());
                        },
                    label: "Continue",
                    color: theme.primary,
                    fullWidth: true,
                    radius: 5,
                    loading: loading,
                  ),
                  const VSpace(20),
                  resending
                      ? Wrap(
                          children: [
                            Text(
                              "Wait ",
                              style: TextStyles.h6,
                            ),
                            Text(
                              'Resending...',
                              style:
                                  TextStyles.h6.copyWith(color: theme.primary),
                            ),
                          ],
                        )
                      : Wrap(
                          children: [
                            Text(
                              "Didn't get mail ",
                              style: TextStyles.h7,
                            ),
                            Text(
                              'resend Link',
                              style:
                                  TextStyles.h7.copyWith(color: theme.primary),
                            ),
                          ],
                        ).rippleClick(() async {
                          resending = true;
                          setState(() {});
                          await AuthCmnd(context).sendVerifyMailLink();
                          resending = false;
                          setState(() {});
                        }),
                ]),
          ),
        ),
      ),
    );
  }
}
