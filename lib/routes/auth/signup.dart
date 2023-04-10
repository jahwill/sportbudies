import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';
import 'package:sportbudies/routes/mainscreen/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with FormMixin {
  List<String> interest = [];
  bool showPasswrd = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Account",
      ),
      body: Form(
        key: formKey,
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, auth, child) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Insets.l),
            child: SizedBox(
              // height: context.heightPx,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(20),
                  Text(
                    "Get Started",
                    style: TextStyles.h5.copyWith(
                        fontWeight: FontWeight.w700, color: theme.primary),
                  ),
                  const VSpace(2),
                  Text(
                    "build Connection",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(32),
                  Text(
                    "Phone number",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.tel,
                    validator: Validator.phone(maxLength: 11),
                    // onChange: (val) {
                    //   auth.signupDto = auth.signupDto.copyWith(password: val);
                    // },
                    // initialValue: "+234",
                    maxLength: 11,
                    onSaved: (phone) {
                      String numbers = '';
                      if (phone.toString().substring(0, 1).contains('0') &&
                          phone.toString().length == 11) {
                        numbers = '+234${phone?.trim().substring(1)}';
                      }
                      //
                      // else if (phone
                      //         .toString()
                      //         .substring(0, 1)
                      //         .contains('0') &&
                      //     phone.toString().length == 10) {
                      //   numbers = '+234${phone?.trim().substring(1)}';
                      // }
                      auth.signupDto =
                          auth.signupDto.copyWith(phoneNumber: numbers);
                    },
                  ),
                  const VSpace(16),
                  Text(
                    " Email address",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.email,
                    validator: (value) => Validator.email(value),
                    onSaved: (val) {
                      auth.signupDto =
                          auth.signupDto.copyWith(email: val?.trim() ?? '');
                    },
                  ),
                  const VSpace(16),
                  Text(
                    "Password",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.pwd,
                    validator: Validator.password(),
                    obscure: !showPasswrd,
                    onChange: (val) {
                      auth.signupDto = auth.signupDto.copyWith(password: val);
                    },
                    onSaved: (pasword) {
                      auth.signupDto = auth.signupDto
                          .copyWith(password: pasword?.trim() ?? '');
                    },
                    suffix: GestureDetector(
                        onTap: () {
                          showPasswrd = !showPasswrd;
                          setState(() {});
                        },
                        child: Icon(showPasswrd
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff)),
                  ),
                  const VSpace(16),
                  Text(
                    "Confirm password",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.pwd,
                    validator: (val) {
                      if (val != auth.signupDto.password) {
                        return ' Password do not match';
                      } else {
                        return null;
                      }
                    },
                    obscure: !showPasswrd,
                    onSaved: (pasword) {
                      auth.signupDto = auth.signupDto.copyWith(
                          password_confirmation: pasword?.trim() ?? '');
                    },
                    suffix: GestureDetector(
                        onTap: () {
                          showPasswrd = !showPasswrd;
                          setState(() {});
                        },
                        child: Icon(showPasswrd
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff)),
                  ),
                  const VSpace(45),
                  SizedBox(
                    child: Column(children: [
                      PrimaryButton(
                        label: "Sign Up",
                        fullWidth: true,
                        radius: 8,
                        loading: isLoading,
                        onPressed: () {
                          // context.push(InterestScreen());
                          validate(
                            () => load(() => AuthCmnd(context)
                                .createAccount(auth.signupDto)),
                            orElse: () => context
                                .showInAppNotification('Validation Error'),
                          );
                        },
                      ),
                      const VSpace(30),
                      Wrap(
                        children: [
                          Text(
                            "Have and account?",
                            style: TextStyles.body1.copyWith(
                                color: theme.greyWeak,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            " login",
                            style: TextStyles.body1.copyWith(
                                color: theme.primary,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ).rippleClick(() {
                        context.push(const LogInScreen());
                      }),
                      const VSpace(20)
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
