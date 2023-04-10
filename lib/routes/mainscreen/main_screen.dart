import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

import 'bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return WillPopScope(
      onWillPop: () async {
        bool closeApp = false;
        await AnimatedAlertModal.showEmptyModal(context,
            title: 'Are you sure you want to logout ?',
            titleStyle: TextStyles.body2.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1D43FE)),
            showIcon: false,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
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
        return closeApp;
      },
      child: Scaffold(
        bottomNavigationBar: const BottomNav(),
        body: Consumer<MainProvider>(builder: (context, store, child) {
          return IndexedStack(
            index: store.navIndex,
            children: [
              UserProfileScreen(),
              Container(
                child: Center(
                  child: Text(
                    "Currently no data to display",
                    style: TextStyles.h7.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    "Currently no data to discover",
                    style: TextStyles.h7.copyWith(
                        fontWeight: FontWeight.w500, color: theme.greyWeak),
                  ),
                ),
              ),
              SettingsScreen()
            ],
          );
        }),
      ),
    );
  }
}
