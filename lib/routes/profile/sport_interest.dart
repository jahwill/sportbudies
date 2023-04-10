import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key, this.buttonTitle}) : super(key: key);
  final String? buttonTitle;
  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> interest = [];
  @override
  void initState() {
    super.initState();
    interest = ProfileCmd(context).profile.profileDto.interest.toList();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (BuildContext context, store, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.heightPx - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(29),
                  Text(
                    "Pick your interest",
                    style: TextStyles.h5.copyWith(
                        fontWeight: FontWeight.w700, color: theme.primary),
                  ),
                  Text(
                    "Choose a sport of interest",
                    style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                  const VSpace(34),
                  SizedBox(
                    // height: 200,
                    width: 300,
                    child: Wrap(
                      children: [
                        ...List.generate(
                            R.M.interest.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    if (interest
                                        .contains(R.M.interest[index])) {
                                      interest.remove(R.M.interest[index]);
                                    } else {
                                      // interest[0] = R.M.interest[index];
                                      interest.add(R.M.interest[index]);
                                      store.profileDto = store.profileDto
                                          .copyWith(interest: interest);
//
                                      // print(interest);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 38,
                                    constraints:
                                        const BoxConstraints(maxWidth: 140),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        color: interest
                                                .contains(R.M.interest[index])
                                            ? theme.primary
                                            : null,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: interest
                                                  .contains(R.M.interest[index])
                                              ? theme.background
                                              : theme.greyTextFieldFill,
                                        )),
                                    child: Text(
                                      "  ${R.M.interest[index]}  ",
                                      style: TextStyles.body2.copyWith(
                                        color: interest
                                                .contains(R.M.interest[index])
                                            ? theme.background
                                            : theme.grey,
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  const VSpace(80),
                  // const Divider(),
                  // const VSpace(20),
                  // Text(
                  //   R.S.others,
                  //   style: TextStyles.caption.copyWith(
                  //       fontWeight: FontWeight.w500, color: theme.greyWeak),
                  // ),
                  // const VSpace(4),
                  // CustomFormTextInput(
                  //   label: R.S.others,
                  // ),
                  // const Spacer(),
                  SizedBox(
                    child: Column(children: [
                      PrimaryButton(
                        label: '${interest.length}/5',
                        fullWidth: true,
                        color: theme.secondary,
                        radius: 8,
                        onPressed: () {},
                      ),
                      const VSpace(16),
                      PrimaryButton(
                        label: widget.buttonTitle ?? "Continue",
                        fullWidth: true,
                        radius: 8,
                        onPressed: () {
                          store.navIndex = 1;
                        },
                      ),
                    ]),
                  ),
                  const VSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
