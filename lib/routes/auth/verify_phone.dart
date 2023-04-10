import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen(
      {Key? key,
      // required this.phoneNumber
      this.onPressVerify})
      : super(key: key);
  // final String phoneNumber;
  final Function(String sms)? onPressVerify;
  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> with FormMixin {
  late String newPin = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.phoneNumber);
    // AuthCmnd(context).verifyPhone(widget.phoneNumber, '');
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: const CustomAppBar(
        elevation: 0.2,
        leading: false,
        title: "Verify phone",
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: SizedBox(
            height: context.heightPx - 65,
            child: Column(children: [
              const VSpace(80),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter pin",
                  style: TextStyles.body3.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.black.withOpacity(0.6)),
                ),
              ),
              const VSpace(10),
              SizedBox(
                width: 272,
                child: Pinput(
                  onChanged: (pin) {
                    newPin = pin;
                  },
                  onSubmitted: (pins) {
                    // newPin = pins;
                  },
                  length: 6,
                  obscureText: true,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: theme.pinTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: theme.bg2,
                      border:
                          Border.all(color: theme.greyWeak.withOpacity(0.55)),
                      borderRadius: Corners.s5Border,
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.cyan),
                      borderRadius: Corners.s10Border,
                    ),
                  ),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              const VSpace(40),
              PrimaryButton(
                onPressed: () {
                  validate(() {
                    widget.onPressVerify != null
                        ? load(() => widget.onPressVerify!(newPin))
                        : null;
                  });
                },
                label: "Verify code",
                color: theme.primary,
                fullWidth: true,
                radius: 5,
              ),
              const VSpace(30),
              Wrap(
                children: [
                  Text(
                    "resend",
                    style: TextStyles.body1.copyWith(
                        color: theme.greyWeak, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    " OTP",
                    style: TextStyles.body1.copyWith(
                        color: theme.primary, fontWeight: FontWeight.w400),
                  ),
                ],
              ).rippleClick(() {
                AuthCmnd(context)
                    .verifyPhone(AuthCmnd(context).auth.signupDto.phoneNumber);
              }),
            ]),
          ),
        ),
      ),
    );
  }
}
