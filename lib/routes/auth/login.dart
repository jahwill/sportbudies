// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with FormMixin {
  LoginModel model = LoginModel.init();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(
        title: "login",
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: SizedBox(
            // height: context.heightPx,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(29),
                Text(
                  "Welcome Back",
                  style: TextStyles.h5.copyWith(
                      fontWeight: FontWeight.w700, color: theme.primary),
                ),
                Text(
                  "SportBuddy",
                  style: TextStyles.caption.copyWith(
                      fontWeight: FontWeight.w500, color: theme.greyWeak),
                ),
                const VSpace(48),
                Text(
                  "Email address",
                  style: TextStyles.caption.copyWith(
                      fontWeight: FontWeight.w500, color: theme.greyWeak),
                ),
                const VSpace(4),
                CustomFormTextInput(
                  type: InputType.email,
                  validator: (value) => Validator.email(value),
                  onSaved: (val) {
                    model = model.copyWith(email: val?.trim() ?? '');
                  },
                ),
                const VSpace(16),
                Text(
                  "password",
                  style: TextStyles.caption.copyWith(
                      fontWeight: FontWeight.w500, color: theme.greyWeak),
                ),
                const VSpace(4),
                CustomFormTextInput(
                  type: InputType.pwd,
                  validator: Validator.password(),
                  // obscure: !showPasswrd,
                  onSaved: (pasword) {
                    model = model.copyWith(password: pasword?.trim() ?? '');
                  },
                  // suffix: GestureDetector(
                  //   onTap: () {
                  //     // showPasswrd = !showPasswrd;
                  //     setState(() {});
                  //   },
                  //   // child: Icon(showPasswrd
                  //   //     ? FeatherIcons.eye
                  //   //     : FeatherIcons.eyeOff)
                  // ),
                ),
                const VSpace(16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "forgot password",
                    style: TextStyles.body2.copyWith(
                        color: theme.greyStrong,
                        decoration: TextDecoration.underline),
                  ),
                ).rippleClick(() {
                  context.push(SendPasswordOtpScreen());
                }),
                // const Spacer(),
                const VSpace(40),
                SizedBox(
                  child: Column(children: [
                    PrimaryButton(
                      label: "login",
                      fullWidth: true,
                      loading: isLoading,
                      radius: 8,
                      onPressed: () {
                        validate(() {
                          load(() => AuthCmnd(context).logIn(model));
                        });
                      },
                    ),
                    const VSpace(16),
                    Wrap(
                      children: [
                        Text(
                          "No account?",
                          style: TextStyles.body1.copyWith(
                              color: theme.greyWeak,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "  signUp",
                          style: TextStyles.body1.copyWith(
                              color: theme.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ).rippleClick(() {
                      context.push(const SignUpScreen());
                    }),
                  ]),
                ),
                const VSpace(100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
