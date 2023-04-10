import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with ScaffoldKeyMixin {
  bool enablePin = false;
  // late UserModel user;
  ProfileModel profile = ProfileModel.init();
  TextEditingController bioController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    CollectionReference users = R.N.fireStore.collection('users');
    return Scaffold(
      key: scaffoldKey,
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(AuthCmnd(context).auth.user?.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            profile = ProfileModel.init();
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            profile = ProfileModel.init();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.push(const ProfileMainScreen());
            });
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data!.exists) {
            // print(snapshot.data!.data());
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            profile = ProfileModel.fromJson(data['profile']);

            bioController.text = profile.bio;
            mailController.text = profile.email;
            usernameController.text = profile.username;
            interestController.text = profile.interest.join(" , ");
            phoneController.text = profile.phone;
          } //
          return Consumer<ProfileProvider>(
            builder: (BuildContext context, store, child) => Column(
              children: [
                Container(
                  height: 210,
                  width: context.widthPx,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    theme.primary.withOpacity(0.7),
                    theme.primary.withOpacity(0.7),
                  ])),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const VSpace(30),
                        GestureDetector(
                          onTap: () {},
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: theme.background)),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: SvgIcon(
                                    R.I.userSquare.svg,
                                    size: 15,
                                    color: theme.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: -10,
                                  top: 15,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: theme.primaryVariant,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child:
                                        SvgIcon(R.I.galleryAdd.svg, size: 15),
                                  ))
                            ],
                          ),
                        ),
                        const VSpace(18),
                        Text(
                          profile.firstName + profile.lastName,
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VSpace(20),

                        // CustomFormTextInput(

                        Row(
                          children: [
                            Text(
                              "Bio",
                              style: TextStyles.body1.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.greyWeak),
                            ),
                            const Spacer(),
                            Icon(
                              FeatherIcons.edit2,
                              color: theme.greyWeak,
                            ).clickable(() {
                              context.push(UpdateBioCoverPage(
                                initialBio: profile.bio,
                              ));
                            })
                          ],
                        ),
                        // const VSpace(20),
                        Divider(
                          color: theme.greyTextFieldFill,
                          thickness: 0.5,
                        ),
                        const VSpace(5.0),
                        Container(
                          // height: ,
                          constraints: BoxConstraints(
                              minHeight: 200,
                              maxHeight: 300,
                              maxWidth: 400,
                              minWidth: context.widthPx),

                          child: Text(
                            profile.bio,
                            style: TextStyles.body1,
                          ),
                        ),
                        const VSpace(15.0),
                        Divider(
                          color: theme.greyTextFieldFill,
                          thickness: 0.5,
                        ),
                        const VSpace(15.0),

                        Text(
                          "Email",
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.greyWeak),
                        ),
                        const VSpace(6.0),

                        CustomFormTextInput(
                          readOnly: true,
                          // initialValue: profile.email,
                          controller: mailController,
                          validator: Validator.string(),
                          onSaved: (value) {
                            profile = profile.copyWith(email: value!);
                          },
                          prefix: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HSpace(5),
                                SvgPicture.asset(
                                  R.I.sms.svg,
                                  color: theme.black,
                                )
                              ]),
                        ),
                        const VSpace(15.0),
                        Text(
                          "phone",
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.greyWeak),
                        ),
                        const VSpace(6.0),
                        CustomFormTextInput(
                          readOnly: true,
                          controller: phoneController,
                          // initialValue: profile.phone,
                          validator: Validator.string(),
                          onSaved: (value) {
                            profile = profile.copyWith(phone: value!);
                          },
                          prefix: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HSpace(5),
                                SvgPicture.asset(
                                  R.I.call.svg,
                                  color: theme.greyWeak,
                                )
                              ]),
                        ),
                        const VSpace(15.0),
                        Text(
                          "username",
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.greyWeak),
                        ),
                        const VSpace(6.0),
                        CustomFormTextInput(
                          readOnly: true,
                          // initialValue: profile.username,
                          controller: usernameController,
                          validator: Validator.string(),
                          onSaved: (value) {
                            profile = profile.copyWith(phone: value!);
                          },
                          prefix: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HSpace(5),
                                SvgPicture.asset(
                                  R.I.userSquare.svg,
                                  color: theme.greyWeak,
                                )
                              ]),
                        ),
                        const VSpace(15.0),
                        Text(
                          "Interests",
                          style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.greyWeak),
                        ),
                        const VSpace(6.0),
                        Stack(
                          children: [
                            CustomFormTextInput(
                              readOnly: true,
                              // initialValue: profile.interest.join('*'),
                              controller: interestController,
                              prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const HSpace(5),
                                    SvgPicture.asset(
                                      R.I.love.svg,
                                      color: theme.greyWeak,
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        const VSpace(20),
//
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileActionItem extends StatelessWidget {
  const ProfileActionItem(
      {Key? key,
      required this.theme,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.trailingWidget,
      this.textColor = Colors.black,
      this.showTrailingIcon = true,
      this.onPressed})
      : super(key: key);

  final AppTheme theme;
  final String title;
  final String subTitle;
  final Widget icon;
  final Widget? trailingWidget;
  final bool showTrailingIcon;
  final Color textColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          height: 50,
          width: context.widthPx,
          margin: const EdgeInsets.only(bottom: 8),
          constraints: const BoxConstraints(maxWidth: 450),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: theme.white,
              boxShadow: Shadows.small),
          child: RawMaterialButton(
            padding: const EdgeInsets.all(8),
            highlightColor: theme.primary.withOpacity(0.2),
            onPressed: onPressed,
            child: Row(children: [
              icon,
              HSpace(Insets.l),
              Text(
                title,
                style: TextStyles.body2
                    .copyWith(fontWeight: FontWeight.w600, color: textColor),
              ),
              const Spacer(),
              if (showTrailingIcon == true) ...[
                trailingWidget ??
                    Icon(
                      FeatherIcons.chevronRight,
                      color: theme.primary,
                    )
              ],
            ]),
          )),
    );
  }
}

class UpdateBioCoverPage extends StatefulWidget {
  const UpdateBioCoverPage({Key? key, required this.initialBio})
      : super(key: key);
  final String initialBio;
  @override
  State<UpdateBioCoverPage> createState() => _UpdateBioCoverPageState();
}

class _UpdateBioCoverPageState extends State<UpdateBioCoverPage>
    with FormMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Update your bio',
      ),
      body: Form(
        key: formKey,
        child: Consumer2<ProfileProvider, AuthProvider>(
          builder: (BuildContext context, profile, auth, child) =>
              SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const VSpace(20),
                SizedBox(
                  // height: 200,
                  // width: 150,
                  child: BaseTextInput(
                    onChanged: (v) {
                      profile.profileDto = profile.profileDto.copyWith(bio: v);
                    },
                    // controller: bioController,
                    initialValue: widget.initialBio,
                    hintText: "Say something about you",
                    maxLines: 18,

                    // isRequired: false,
                  ),
                ),
                const VSpace(30),
                PrimaryButton(
                  label: "Save",
                  fullWidth: true,
                  loading: isLoading,
                  radius: 8,
                  onPressed: () {
                    validate(() {
                      load(() => ProfileCmd(context).updateSingleField(
                              "profile.bio",
                              profile.profileDto.bio,
                              auth.user as User, onSuccessUpdate: () {
                            context.showInAppNotification(
                                'Cover profile updated successfully!');
                          }));
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
