import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';
//
// class ChangePasswordMainScreen extends StatelessWidget {
//   const ChangePasswordMainScreen(
//       {Key? key, required this.sendResetOTP, this.userResetEmail = ''})
//       : super(key: key);
//   final bool sendResetOTP;
//   final String userResetEmail;
//   @override
//   Widget build(BuildContext context) {
//     return sendResetOTP
//         ? const SendPasswordOtpScreen()
//         : ResetPasswordScreen(
//             userResetEmail: userResetEmail,
//           );
//   }
// }
//
// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }
//
// class _ChangePasswordScreenState extends State<ChangePasswordScreen>
//     with FormMixin {
//   ResetPasswordModel model = ResetPasswordModel.init();
//   bool showPasswrd = false;
//   bool showNewPasswrd = false;
//   bool showConfirmNewPasswrd = false;
//
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Change Password",
//         leadingIconColor: theme.primary,
//         elevation: 0.2,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: Insets.l),
//         child: Consumer<AuthProvider>(
//           builder: (BuildContext context, auth, child) => Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const VSpace(40),
//                 Text(
//                   "Current password",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Enter current password',
//                   type: InputType.pwd,
//                   obscure: !showPasswrd,
//                   validator: (val) => Validator.password()(val),
//                   onSaved: (pasword) {
//                     // model = model.copyWith(password: pasword ?? '');
//                   },
//                   suffix: GestureDetector(
//                       onTap: () {
//                         showPasswrd = !showPasswrd;
//                         setState(() {});
//                       },
//                       child: Icon(showPasswrd
//                           ? FeatherIcons.eye
//                           : FeatherIcons.eyeOff)),
//                 ),
//                 const VSpace(20),
//                 Text(
//                   "New password",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Enter new password',
//                   type: InputType.pwd,
//                   obscure: !showNewPasswrd,
//                   validator: (val) => Validator.password()(val),
//                   onChange: (pasword) {
//                     model = model.copyWith(password: pasword);
//                   },
//                   onSaved: (pasword) {
//                     model =
//                         model.copyWith(password_confirmation: pasword ?? '');
//                   },
//                   suffix: GestureDetector(
//                       onTap: () {
//                         showNewPasswrd = !showNewPasswrd;
//                         setState(() {});
//                       },
//                       child: Icon(showNewPasswrd
//                           ? FeatherIcons.eye
//                           : FeatherIcons.eyeOff)),
//                 ),
//                 const VSpace(20),
//                 Text(
//                   "Confirm new password",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Retype new password',
//                   type: InputType.pwd,
//                   obscure: !showConfirmNewPasswrd,
//                   validator: (val) {
//                     if (val == model.password_confirmation) {
//                       return null;
//                     } else {
//                       return 'passwords do not match';
//                     }
//                   },
//                   onSaved: (pasword) {
//                     // model = model.copyWith(confirmPassword: pasword ?? '');
//                   },
//                   suffix: GestureDetector(
//                       onTap: () {
//                         showConfirmNewPasswrd = !showConfirmNewPasswrd;
//                         setState(() {});
//                       },
//                       child: Icon(showConfirmNewPasswrd
//                           ? FeatherIcons.eye
//                           : FeatherIcons.eyeOff)),
//                 ),
//                 const VSpace(40),
//                 PrimaryButton(
//                   onPressed: () {
//                     model = model.copyWith(
//                         email: auth.user.email, token: auth.token);
//                     validate(() {
//                       load(
//                         () => ChangePasswordCmd(context)
//                             .changePassword(model.toJson()),
//                       );
//                     });
//                   },
//                   label: 'Change password',
//                   radius: 4,
//                   fullWidth: true,
//                   loading: isLoading,
//                   contentPadding: EdgeInsets.symmetric(vertical: 17),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({Key? key, this.userResetEmail = ''})
//       : super(key: key);
//   final String userResetEmail;
//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }
//
// class _ResetPasswordScreenState extends State<ResetPasswordScreen>
//     with FormMixin {
//   ResetPasswordModel model = ResetPasswordModel.init();
//
//   bool showNewPasswrd = false;
//   bool showConfirmNewPasswrd = false;
//   bool resending = false;
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Reset password",
//         leadingIconColor: theme.primary,
//         elevation: 0.2,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: Insets.l),
//         child: Consumer<AuthProvider>(
//           builder: (BuildContext context, auth, child) => Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const VSpace(40),
//                 Text(
//                   "New password",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Enter new password',
//                   type: InputType.pwd,
//                   obscure: !showNewPasswrd,
//                   validator: (val) => Validator.password()(val),
//                   onChange: (pasword) {
//                     model = model.copyWith(password: pasword);
//                   },
//                   onSaved: (pasword) {
//                     model = model.copyWith(password: pasword?.trim() ?? '');
//                   },
//                   suffix: GestureDetector(
//                       onTap: () {
//                         showNewPasswrd = !showNewPasswrd;
//                         setState(() {});
//                       },
//                       child: Icon(showNewPasswrd
//                           ? FeatherIcons.eye
//                           : FeatherIcons.eyeOff)),
//                 ),
//                 const VSpace(14),
//                 Text(
//                   "Confirm new password",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Retype new password',
//                   type: InputType.pwd,
//                   obscure: !showConfirmNewPasswrd,
//                   validator: (val) {
//                     if (val == model.password) {
//                       return null;
//                     } else {
//                       return 'passwords do not match';
//                     }
//                   },
//                   onSaved: (pasword) {
//                     model = model.copyWith(
//                         password_confirmation: pasword?.trim() ?? '');
//                   },
//                   suffix: GestureDetector(
//                       onTap: () {
//                         showConfirmNewPasswrd = !showConfirmNewPasswrd;
//                         setState(() {});
//                       },
//                       child: Icon(showConfirmNewPasswrd
//                           ? FeatherIcons.eye
//                           : FeatherIcons.eyeOff)),
//                 ),
//                 const VSpace(14),
//                 Text(
//                   "Sent OTP",
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 const VSpace(10),
//                 CustomFormTextInput(
//                   hintText: 'Enter OTP sent to your email',
//                   type: InputType.num,
//                   maxLength: 4,
//                   validator: (val) {
//                     if (val?.length == 4) {
//                       return null;
//                     } else {
//                       return 'Token digit should be 4 digit';
//                     }
//                   },
//                   onSaved: (token) {
//                     model = model.copyWith(
//                         email: auth.user.email, token: token?.trim() ?? "");
//                   },
//                 ),
//                 const VSpace(40),
//                 PrimaryButton(
//                   onPressed: () {
//                     validate(() {
//                       load(
//                         () => ChangePasswordCmd(context)
//                             .resetPassword(model.toJson()),
//                       );
//                     });
//                   },
//                   label: 'Reset password',
//                   radius: 4,
//                   fullWidth: true,
//                   loading: isLoading,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 17),
//                 ),
//                 const VSpace(30),
//                 resending
//                     ? Wrap(
//                         children: [
//                           Text(
//                             "Wait ",
//                             style: TextStyles.h6,
//                           ),
//                           Text(
//                             'Resending...',
//                             style: TextStyles.h6.copyWith(color: theme.blue),
//                           ),
//                         ],
//                       ).center()
//                     : Wrap(
//                         children: [
//                           Text(
//                             "Didn't get mail ",
//                             style: TextStyles.h7,
//                           ),
//                           Text(
//                             'Resend Token.',
//                             style: TextStyles.h7.copyWith(color: theme.blue),
//                           ),
//                         ],
//                       ).center().rippleClick(() async {
//                         resending = true;
//                         setState(() {});
//                         await ChangePasswordCmd(context).resetPassword(
//                           {'email': widget.userResetEmail},
//                         );
//                         resending = false;
//                         setState(() {});
//                       }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SendPasswordOtpScreen extends StatefulWidget {
//   const SendPasswordOtpScreen({Key? key, this.goHomeOnComplete})
//       : super(key: key);
//   final bool? goHomeOnComplete;
//   @override
//   State<SendPasswordOtpScreen> createState() => _SendPasswordOtpScreenState();
// }
//
// class _SendPasswordOtpScreenState extends State<SendPasswordOtpScreen>
//     with FormMixin {
//   String email = '';
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     return Scaffold(
//       appBar: const CustomAppBar(
//         elevation: 0.4,
//         title: 'Reset Password',
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: CustomContainer(
//           color: Theme.of(context).colorScheme.background,
//           height: context.heightPx - 65,
//           child: Form(
//             key: formKey,
//             child: Column(children: [
//               const VSpace(70),
//               Text(
//                 "Enter email address associated to the account",
//                 textAlign: TextAlign.center,
//                 style: TextStyles.body1.copyWith(
//                     fontWeight: FontWeight.w400, color: theme.textColor1),
//               ),
//               const VSpace(30),
//               Text(
//                 "Enter address",
//                 textAlign: TextAlign.center,
//                 style: TextStyles.body3.copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: theme.black.withOpacity(0.6)),
//               ),
//               const VSpace(10),
//               CustomFormTextInput(
//                 type: InputType.email,
//                 hintText: 'Enter valid email',
//                 validator: (value) => Validator.email(value),
//                 onSaved: (val) {
//                   // print(val);
//                   email = val!.trim();
//                   setState(() {});
//                 },
//               ),
//               const VSpace(30),
//               PrimaryButton(
//                 onPressed: () {
//                   validate(() => load(
//                         () => ChangePasswordCmd(context).resetPassword(
//                             {'email': email},
//                             goHomeOnComplete: widget.goHomeOnComplete ?? false),
//                       ));
//                 },
//                 label: "Send",
//                 color: Theme.of(context).primaryColor,
//                 fullWidth: true,
//                 radius: 5,
//                 loading: isLoading,
//               ),
//               const VSpace(50),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SendPasswordOtpScreen extends StatefulWidget {
  const SendPasswordOtpScreen({Key? key, this.goHomeOnComplete})
      : super(key: key);
  final bool? goHomeOnComplete;
  @override
  State<SendPasswordOtpScreen> createState() => _SendPasswordOtpScreenState();
}

class _SendPasswordOtpScreenState extends State<SendPasswordOtpScreen>
    with FormMixin {
  String email = '';
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: const CustomAppBar(
        elevation: 0.4,
        title: 'Reset Password',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomContainer(
          color: Theme.of(context).colorScheme.background,
          height: context.heightPx - 65,
          child: Form(
            key: formKey,
            child: Column(children: [
              const VSpace(70),
              Text(
                "Enter email address associated to the account",
                textAlign: TextAlign.center,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w400, color: theme.textColor1),
              ),
              const VSpace(30),
              Text(
                "Enter address",
                textAlign: TextAlign.center,
                style: TextStyles.body3.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.black.withOpacity(0.6)),
              ),
              const VSpace(10),
              CustomFormTextInput(
                type: InputType.email,
                hintText: 'Enter valid email',
                validator: (value) => Validator.email(value),
                onSaved: (val) {
                  // print(val);
                  email = val!.trim();
                  setState(() {});
                },
              ),
              const VSpace(30),
              PrimaryButton(
                onPressed: () {
                  validate(() => load(
                        () => AuthCmnd(context).resetUserPassword(email,
                            onSuccessAction: () {
                          context.push(ResetPasswordNoticeScreen(
                            email: email,
                          ));
                        }),
                      ));
                },
                label: "Send",
                color: Theme.of(context).primaryColor,
                fullWidth: true,
                radius: 5,
                loading: isLoading,
              ),
              const VSpace(50),
            ]),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordNoticeScreen extends StatefulWidget {
  const ResetPasswordNoticeScreen(
      {Key? key, this.onClickContinue, required this.email})
      : super(key: key);
  final Function()? onClickContinue;
  final String email;
  @override
  State<ResetPasswordNoticeScreen> createState() =>
      _ResetPasswordNoticeScreenState();
}

class _ResetPasswordNoticeScreenState extends State<ResetPasswordNoticeScreen> {
  bool loading = false;
  bool resending = false;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0.3,
        leadingIconColor: theme.primary,
        leading: false,
        title: 'Pasoword reset',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.l),
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, store, child) =>
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const VSpace(150),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Reset password",
                style: TextStyles.h5,
              ),
            ),
            const VSpace(10.0),
            RichText(
              textAlign: TextAlign.center,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
              text: TextSpan(
                style: TextStyles.body1
                    .copyWith(color: theme.black.withOpacity(0.5), height: 1.7),
                children: [
                  TextSpan(
                    text: " A reset password email link has been sent to you ",
                  ),
                  TextSpan(
                    text: store.user?.email,
                    style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w600, color: theme.black),
                  ),
                  const TextSpan(
                    text:
                        '. Follow the link sent to you to reset your password and come back here to continue with the app.',
                  )
                ],
              ),
            ),
            const VSpace(50),
            PrimaryButton(
              onPressed: widget.onClickContinue ??
                  () {
                    context.pushOff(const LogInScreen());
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
                        style: TextStyles.h6.copyWith(color: theme.primary),
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
                        style: TextStyles.h7.copyWith(color: theme.primary),
                      ),
                    ],
                  ).rippleClick(() async {
                    resending = true;
                    setState(() {});
                    await AuthCmnd(context).resetUserPassword(widget.email);
                    resending = false;
                    setState(() {});
                  }),
          ]),
        ),
      ),
    );
  }
}
