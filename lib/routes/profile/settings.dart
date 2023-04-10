import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with ScaffoldKeyMixin, FormMixin {
  bool enablePin = false;
  SignUpModel signUpModel = SignUpModel.init();
  ProfileModel profile = ProfileModel.init();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        leading: false,
        title: "Account Settings",
      ),
      body: Form(
        key: formKey,
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, auth, child) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(40),
                ProfileActionItem(
                  onPressed: () {
                    MCustomBottomSheet.showBasicBottomSheet(
                        context, const ChangePassword(),
                        showDragTopICon: true,
                        scaffoldKey: scaffoldKey,
                        sizeFraction: 0.5);
                  },
                  theme: theme,
                  title: "Change Password",
                  subTitle: "",
                  icon: SvgIcon(
                    R.I.lock.svg,
                    color: theme.black,
                    size: 20,
                  ),
                ),
                ProfileActionItem(
                  onPressed: () {
                    MCustomBottomSheet.showBasicBottomSheet(
                        context, const UpdateEmail(),
                        showDragTopICon: true,
                        scaffoldKey: scaffoldKey,
                        sizeFraction: 0.5);
                  },
                  theme: theme,
                  title: "Update email",
                  subTitle: "",
                  icon: SvgIcon(
                    R.I.sms.svg,
                    color: theme.black,
                    size: 20,
                  ),
                ),
                ProfileActionItem(
                  onPressed: () {
                    MCustomBottomSheet.showBasicBottomSheet(
                        context, const UpdateUsername(),
                        showDragTopICon: true,
                        scaffoldKey: scaffoldKey,
                        sizeFraction: 0.5);
                  },
                  theme: theme,
                  title: "Update username",
                  subTitle: "",
                  icon: SvgIcon(
                    R.I.userSquare.svg,
                    color: theme.black,
                    size: 20,
                  ),
                ),
                ProfileActionItem(
                  theme: theme,
                  onPressed: () {
                    AnimatedAlertModal.showEmptyModal(context,
                        title: 'Are you sure you want to logout ?',
                        titleStyle: TextStyles.body2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D43FE)),
                        showIcon: false,
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              // style: TextButton.styleFrom(),
                              onPressed: () => context.pop(),
                              child: Text(
                                'No',
                                style: TextStyles.body3.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: theme.black),
                              ),
                            ),
                            const HSpace(90),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await AuthCmnd(context).logOut();
                              },
                              child: Text(
                                'Yes',
                                style: TextStyles.body3
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ));
                  },
                  title: "logout",
                  subTitle: "A you sure you want to log out?",
                  textColor: theme.redButton,
                  showTrailingIcon: false,
                  icon:
                      SvgIcon(R.I.logout.svg, color: theme.redButton, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with FormMixin {
  SignUpModel signUpModel = SignUpModel.init();
  bool showPasswrd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<AuthProvider>(
            builder: (BuildContext context, auth, child) => Column(
              children: [
                const VSpace(20),
                CustomFormTextInput(
                  // readOnly: true,
                  hintText: "Enter current password",
                  validator: Validator.string(),
                  obscure: showPasswrd,
                  onSaved: (value) {
                    signUpModel = signUpModel.copyWith(password: value ?? "");
                  },
                  prefix: GestureDetector(
                      onTap: () {
                        showPasswrd = !showPasswrd;
                        setState(() {});
                      },
                      child: Icon(showPasswrd
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff)),
                ),
                VSpace(20),
                CustomFormTextInput(
                    // readOnly: true,
                    hintText: "Enter new password",
                    validator: Validator.string(),
                    obscure: showPasswrd,
                    onSaved: (value) {
                      signUpModel = signUpModel.copyWith(
                          password_confirmation: value ?? "");
                    },
                    prefix: GestureDetector(
                        onTap: () {
                          showPasswrd = !showPasswrd;
                          setState(() {});
                        },
                        child: Icon(showPasswrd
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff))),
                const VSpace(20),
                PrimaryButton(
                  label: "update",
                  fullWidth: true,
                  loading: isLoading,
                  radius: 8,
                  onPressed: () {
                    validate(() {
                      load(() => AuthCmnd(context).changeFireBasePassword(
                          email: auth.user?.email as String,
                          password: signUpModel.password,
                          newPassword: signUpModel.password_confirmation));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({Key? key}) : super(key: key);

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> with FormMixin {
  SignUpModel signUpModel = SignUpModel.init();
  ProfileModel profile = ProfileModel.init();
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const VSpace(20),
              CustomFormTextInput(
                hintText: "Enter username",
                validator: Validator.string(),
                onSaved: (value) {
                  profile = profile.copyWith(username: value ?? "");
                },
                prefix: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HSpace(5),
                      SvgPicture.asset(
                        R.I.sms.svg,
                        color: theme.greyWeak,
                      )
                    ]),
              ),
              const VSpace(20),
              PrimaryButton(
                label: "update",
                fullWidth: true,
                loading: isLoading,
                radius: 8,
                onPressed: () {
                  validate(() {
                    load(() => ProfileCmd(context)
                        .updateUserProfile(userName: profile.username));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({Key? key}) : super(key: key);

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> with FormMixin {
  SignUpModel signUpModel = SignUpModel.init();
  ProfileModel profile = ProfileModel.init();
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomFormTextInput(
                // readOnly: true,
                hintText: "Enter email",
                validator: Validator.string(),
                onSaved: (value) {
                  signUpModel = signUpModel.copyWith(email: value ?? "");
                },
                prefix: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HSpace(5),
                      SvgPicture.asset(
                        R.I.sms.svg,
                        color: theme.greyWeak,
                      )
                    ]),
              ),
              const VSpace(20),
              PrimaryButton(
                label: "update",
                fullWidth: true,
                loading: isLoading,
                radius: 8,
                onPressed: () {
                  validate(() {
                    load(() => ProfileCmd(context)
                        .updateUserProfile(newEmail: signUpModel.email));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
