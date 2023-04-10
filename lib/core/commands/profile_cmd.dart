// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:sportbudies/export.dart';

class ProfileCmd extends BaseCommand {
  ProfileCmd(super.c);
  AuthProvider get auth => getProvider<AuthProvider>();
  ProfileProvider get profile => getProvider<ProfileProvider>();

  Future<void> createProfile(ProfileModel model) async {
    BuildContext contxt = rootNav!.context;
    AuthService service = AuthService();

    String? res = await service.createUserProfile(model, auth.user);
    // print(res);

    if (res == "User-profile-created-successfully!".trim()) {
      updateUserProfile(newPhoneNumber: model.phone);

      contxt.showInAppNotification("User profile created successfully!",
          type: InAppNotificationType.success);
      contxt.pushOff(const MainScreen());
    } else {
      contxt.showInAppNotification(
        "$res ::: This error happened while creating your profile",
      );
    }
  }

  Future<void> getProfile() async {
    BuildContext contxt = rootNav!.context;
    // AuthService service = AuthService();

    // UserCredential? userCredential = await service.login(model);
    // if (userCredential != null) {
    //
    // }
    // print(userCredential);
  }

  Future<void> updateProfile(Map<String, dynamic> payload) async {}

  Future<void> updateUserProfile({
    String userName = '',
    String newEmail = '',
    String newPassword = '',
    newPhoneNumber = '',
  }) async {
    BuildContext contxt = rootNav!.context;
    var user = R.N.firebase.currentUser;
    try {
      if (userName != '') {
        await user?.updateDisplayName(userName);
        updateSingleField("profile.username", userName, auth.user as User);
        contxt.showInAppNotification("$userName updated successfully!",
            type: InAppNotificationType.success);
        Navigator.of(contxt).pop();
      } else if (newEmail != '') {
        await user?.updateEmail(newEmail);
        await updateSingleField(
            "profile.username", userName, auth.user as User);

        contxt.showInAppNotification("$newEmail updated successfully!",
            type: InAppNotificationType.success);
        Navigator.of(contxt).pop();
      } else if (newPassword != '') {
        await user?.updatePassword(newPassword);
        contxt.showInAppNotification("$newPassword updated successfully!",
            type: InAppNotificationType.success);
      } else if (newPhoneNumber != '') {
        //todo; logit to update user phone number her
        // await _user?.updatePhoneNumber(newphoneNumber);
        // return true;
        await updateSingleField("profile.phone", userName, auth.user as User);

        // contxt.showInAppNotification("$newPhoneNumber updated successfully!",
        //     type: InAppNotificationType.success);
      }
    } catch (e) {
      contxt.showInAppNotification("$e happened",
          type: InAppNotificationType.success);
      // e.toString();
    }
  }

  //update a single field  in user profile document field
  Future<bool> updateSingleField(String fieldName, String value, User user,
      {Function()? onSuccessUpdate}) async {
    try {
      CollectionReference _userCollectionReference =
          R.N.fireStore.collection('users');

      _userCollectionReference.doc(user.uid).update({fieldName: value});
      if (onSuccessUpdate != null) {
        onSuccessUpdate();
      }
      return true;
    } on FirebaseException catch (err) {
      err.code.toString();
      return false;
    }
  }

  //update a single field  in user  document field
  Future<bool> updateSingleFieldWithMap(
      String fieldName, Map<String, dynamic> value, User user) async {
    try {
      CollectionReference _userCollectionReference =
          R.N.fireStore.collection('users');
      _userCollectionReference.doc(user.uid).update({fieldName: value});
      return true;
    } on FirebaseException catch (err) {
      err.code.toString();
      return false;
    }
  }
}
