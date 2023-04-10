import 'package:sportbudies/export.dart';

class AuthService extends BaseService {
  @override
  Future<UserCredential?> createAccount(SignUpModel signUpModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUpModel.email.trim(),
              password: signUpModel.password.trim());

      return userCredential;
    } on FirebaseAuthException catch (e) {
      AuthException.displayError(e);

      return null;
    }
  }

  @override
  Future<UserCredential?> login(LoginModel model) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: model.email.trim(), password: model.password.trim());
      log("firebase User Details.::::..${userCredential.user?.uid}..........loginCmd class line 53");
      initializeFlutterFire();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      AuthException.displayError(e);

      return null;
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  ///this is use to call user authState Listener if user is still log in or out
  @override
  Future<User?> initializeFlutterFire() async {
    User? user;
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        user = user;
      });
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> changePassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    final user = FirebaseAuth.instance.currentUser;
    bool operationStatus = false;
    final cred = EmailAuthProvider.credential(email: email, password: password);

    user?.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((value) async {
        log('Firebase password Successfully changed AuthRepository line......>>89');

        operationStatus = true;
      }).catchError((err) {
        log('failed to change password $err AuthRepository line......>>93');
        operationStatus = false;
      });
    }).catchError((err) {
      log('failed to change password $err AuthRepository line......>>87');

      operationStatus = false;
    });
    return operationStatus;
  }

  @override
  Future<bool> sendMailVerification(User? user) async {
    if (user != null) {
      // print('this is happening');
      await (user.sendEmailVerification());
      await user.reload();
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isUserEmailVerified(User? user) async {
    await user?.reload();
    if (user?.emailVerified == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> resetUserPassword(String email) async {
    // await user?.reload();
    // if (user != null) {
    return await R.N.firebase
        .sendPasswordResetEmail(email: email.toString().trim())
        .then((value) => 'Email-link-has-been-sent')
        .catchError((er) => '$er :: error happens');
  }

  @override
  Future<dynamic> createUserProfile(
      ProfileModel profileModel, User? user) async {
    try {
      CollectionReference _userCollectionReference =
          R.N.fireStore.collection('users');

      return await _userCollectionReference
          .doc(user?.uid)
          .set({"profile": profileModel.toJson()}, SetOptions(merge: true))
          .then((value) => 'User-profile-created-successfully!'.trim())
          .catchError((err) => err);
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<String> changeFireBasePassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    final user = R.N.firebase.currentUser;
    final cred = EmailAuthProvider.credential(email: email, password: password);
    String res = '';

    user?.reauthenticateWithCredential(cred).then((value) {
      String res0 = '';
      user.updatePassword(newPassword).then((value) async {
        res0 = 'Password-changed-successfully';
      }).catchError((err) {
        res0 = 'error occurred:: $err';
        // ctx.showInAppNotification('Password changed failed');
      });

      res = res0;
    }).catchError((err) {
      res = 'error occurred:: $err';
      // ctx.showInAppNotification('Password changed failed::reason $err ');
    });

    return res;
  }
}
