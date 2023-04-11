import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with FormMixin {
  late String gender;
  late String dateOfBirth = DateTime.now().toString();
  @override
  void initState() {
    // TODO: implement initState

    gender = R.M.gender[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Consumer2<AuthProvider, ProfileProvider>(
            builder: (BuildContext context, auth, profile, child) {
          ///pre populate the email , phoneNumber of  profile model
          WidgetsBinding.instance.addPostFrameCallback((_) {
            profile.profileDto = profile.profileDto.copyWith(
                email: auth.user?.email ?? "",
                phone: auth.signupDto.phoneNumber ?? "''");
          });
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Insets.l),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(20),
                  Text(
                    "Set up Profile",
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
                    "Bio",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(8),
                  BaseTextInput(
                    onChanged: (v) {
                      profile.profileDto = profile.profileDto.copyWith(bio: v);
                    },
                    hintText: "Say something about you",
                    maxLines: 5,
                    // isRequired: false,
                  ),
                  const VSpace(22),
                  Text(
                    "First Name",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.txt,
                    validator: Validator.string(),
                    onSaved: (val) {
                      profile.profileDto =
                          profile.profileDto.copyWith(firstName: val ?? "");
                    },
                  ),
                  const VSpace(16.0),
                  Text(
                    "Last Name",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.txt,
                    validator: Validator.string(),
                    onSaved: (val) {
                      profile.profileDto =
                          profile.profileDto.copyWith(lastName: val ?? "");
                    },
                  ),
                  const VSpace(16.0),
                  Text(
                    "Username",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(4),
                  CustomFormTextInput(
                    type: InputType.txt,
                    validator: Validator.string(),
                    onSaved: (val) {
                      profile.profileDto =
                          profile.profileDto.copyWith(username: val ?? "");
                    },
                  ),

                  const VSpace(20),

                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyles.caption.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.greyWeak),
                            ),
                            const VSpace(4),
                            Container(
                              width: context.widthPx * 0.37,
                              padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 8)
                                  .add(const EdgeInsets.only(left: 10)),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.cyan.withOpacity(0.09)),
                                borderRadius: Corners.s5Border,
                              ),
                              child: DropdownButton(
                                  underline: const SizedBox.shrink(),
                                  style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff23262B),
                                  ),
                                  isExpanded: true,
                                  icon: const Padding(
                                    padding: EdgeInsets.all(13.0),
                                    child: Icon(
                                      FeatherIcons.chevronDown,
                                    ),
                                  ),
                                  value: gender,
                                  items: [
                                    ...R.M.gender.map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    ),
                                  ],
                                  onChanged: (val) {
                                    ///set the gender field
                                    profile.profileDto = profile.profileDto
                                        .copyWith(gender: val.toString());

                                    setState(() => gender = val.toString());
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const HSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of Birth",
                            style: TextStyles.caption.copyWith(
                                fontWeight: FontWeight.w500,
                                color: theme.greyWeak),
                          ),
                          const VSpace(4),
                          SizedBox(
                              height: 57.0,
                              width: context.widthPx * 0.45,
                              child: DateInput(
                                title: "Date of birth",
                                initialDateInString: dateOfBirth,
                                onChanged: (date) {
                                  // dateOfBirth=date;
                                  profile.profileDto = profile.profileDto
                                      .copyWith(dob: date.toString());
                                  // setState(() {
                                  //
                                  // });
                                },
                              )),
                        ],
                      ),
                    ],
                  ),

                  ///

                  const VSpace(40),
                  SizedBox(
                    child: Column(children: [
                      PrimaryButton(
                        label: "Create Profile",
                        fullWidth: true,
                        radius: 8,
                        loading: isLoading,
                        onPressed: () {
                          // print(profile.profileDto.toJson());
                          validate(
                            () => load(() => ProfileCmd(context)
                                .createProfile(profile.profileDto)),
                            orElse: () => context
                                .showInAppNotification('Validation Error'),
                          );
                        },
                      ),
                      const VSpace(30),
                      Wrap(
                        children: [
                          Text(
                            "Go back <<",
                            style: TextStyles.body1.copyWith(
                                color: theme.greyWeak,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ).rippleClick(() {
                        profile.navIndex = 0;
                      }),
                      const VSpace(20)
                    ]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
