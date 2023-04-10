import 'package:sportbudies/export.dart';
import 'package:flutter/material.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
        title: 'Set up Account',
      ),
      body: Consumer<ProfileProvider>(builder: (context, store, child) {
        return IndexedStack(
          index: store.navIndex,
          children: [
            InterestScreen(),
            ProfileScreen(),
          ],
        );
      }),
    );
  }
}
