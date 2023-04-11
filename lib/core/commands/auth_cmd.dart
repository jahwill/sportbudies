// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:sportbudies/export.dart';

class AuthCmnd extends BaseCommand {
  AuthCmnd(super.c);
  AuthProvider get auth => getProvider<AuthProvider>();

  Future<void> createAccount(SignUpModel model) async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    UserCredential? userCredential = await service.createAccount(model);
    if (userCredential != null) {
      auth.setUser = userCredential.user!;
      verifyPhone(model.phoneNumber);
      contxt.showInAppNotification('Account created succesfully! ',
          type: InAppNotificationType.success);

      // //send mail link
      sendVerifyMailLink(showNotification: false);
    }
  }

  //log in user
  Future<void> logIn(LoginModel model) async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    UserCredential? userCredential = await service.login(model);
    if (userCredential != null) {
      auth.setUser = userCredential.user!;
      contxt.pushOff(const MainScreen());
      await isUserEmailVerified();
    }
  }

  //log out user
  Future<void> logOut() async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    await service.logout();
    User? user = await service.initializeFlutterFire();
    if (user == null) {
      contxt.showInAppNotification(' Loged out',
          type: InAppNotificationType.success);
      contxt.pushOff(const LogInScreen());
    } else {
      null;
    }
  }

  //send an email verification link to user mail box
  Future<void> sendVerifyMailLink({bool showNotification = true}) async {
    AuthService service = AuthService();
    BuildContext contxt = rootNav!.context;
    bool res = await service.sendMailVerification(auth.user);

    if (res == true) {
      // log('A verification link has been sent to you. Kindly verify your email ');
      if (showNotification == true) {
        contxt.showInAppNotification(
            'A verification link has been sent to you. Kindly verify your email ',
            type: InAppNotificationType.success);
      } else {
        null;
      }
    }
  }

  //check if user mail is verified
  Future<void> isUserEmailVerified() async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    bool res = await service.isUserEmailVerified(auth.user);

    if (res == true) {
      log('your mail is verified');
      null;
    } else {
      contxt.push(EmailVerificationScreen(
        onClickContinue: () {
          contxt.pop();
        },
      ));
      contxt.showInAppNotification('Your are yet to verify your mail.');
    }
  }

  //password reset
  Future<void> resetUserPassword(String email,
      {Function()? onSuccessAction}) async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    String res = await service.resetUserPassword(email);

    if (res == 'Email-link-has-been-sent') {
      // log('password link sent successfully');
      contxt.showInAppNotification(' reset password link sent successfully,',
          type: InAppNotificationType.success);
      if (onSuccessAction != null) {
        onSuccessAction();
      }
    } else {
      null;
    }
  }

  // change password
  Future<void> changeFireBasePassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    BuildContext ctx = rootNav!.context;
    final user = R.N.firebase.currentUser;
    AuthService service = AuthService();

    String res = await service.changeFireBasePassword(
        email: email, password: password, newPassword: newPassword);

    if (res == "Password-changed-successfully") {
      ctx.showInAppNotification('Password changed successfully',
          type: InAppNotificationType.success);
      ctx.pop();
    } else {
      ctx.showInAppNotification(res);
    }
  }

  //verify phone
  Future<void> verifyPhone(String phoneNumber) async {
    BuildContext contxt = rootNav!.context;
    int? _resendToken;

    await R.N.firebase.verifyPhoneNumber(
      phoneNumber: phoneNumber,

      verificationCompleted: (PhoneAuthCredential credential) async {
        await R.N.firebase
            .signInWithCredential(credential)
            .then((value) => contxt.push(const EmailVerificationScreen()))
            .catchError((e) => 'this error $e happens');
      },

      ///
      verificationFailed: (FirebaseAuthException e) {
        contxt.showInAppNotification(
            'Verification failed try again ${e.message}',
            duration: 9);
      },

      ///
      codeSent: (String verificationId, int? resendToken) {
        contxt.push(
          VerifyPhoneScreen(onPressVerify: (sms) async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: sms);

            /// Sign the user in (or link) with the credential
            await R.N.firebase.signInWithCredential(credential).then((value) {
              /// then navigate to email screen
              contxt.push(const EmailVerificationScreen());
            }).catchError((er) => 'error happened');
          }),
        );

        _resendToken = resendToken;
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: _resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

class AuthException {
  static displayError(e) {
    BuildContext? context = R.N.nav?.context;

    context?.showInAppNotification(getMessageFromErrorCode(e), duration: 9);
  }

  static String getMessageFromErrorCode(e) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }
}
