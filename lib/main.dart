import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';
import 'package:sportbudies/routes/intro/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainProvider()),
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    Provider<BuildContext>(create: (c) => c),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeType = context.select<AppProvider, ThemeType>((val) => val.theme);

    AppTheme theme = AppTheme.fromType(themeType);
    return Provider.value(
      value: theme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: R.N.navKey,
        title: 'Sport buddies',
        theme: theme.themeData,
        home: const IntroScreen(),
        builder: (context, child) => MediaQuery(
          data: context.widthPx < 600
              ? context.mq.copyWith(textScaleFactor: .8)
              : context.mq.copyWith(textScaleFactor: 1),
          child: InAppNotification(
            key: R.N.notifyKey,
            safeAreaPadding: EdgeInsets.zero,
            minAlertHeight: 40.0,
            child: child,
          ),
        ),
      ),
    );
  }
}
