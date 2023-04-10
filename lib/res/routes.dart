import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class MyRoutes {
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  final GlobalKey<InAppNotificationState> notifyKey = GlobalKey();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  FirebaseFirestore get fireStore => _firestore;
  FirebaseAuth get firebase => _firebase;

  NavigatorState? get nav => navKey.currentState;

  static changeUrl() {}
}

class AppContext {
  static MyRoutes myRoutes = MyRoutes();
  static BuildContext materialBuildContext =
      myRoutes.navKey.currentContext as BuildContext;
  BuildContext get context => materialBuildContext;
}
