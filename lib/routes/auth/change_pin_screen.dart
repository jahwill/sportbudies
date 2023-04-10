// import 'package:flutter/material.dart';
// import 'package:telneting_pro/export.dart';
//
// class ChangePinScreen extends StatefulWidget {
//   const ChangePinScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChangePinScreen> createState() => _ChangePinScreenState();
// }
//
// class _ChangePinScreenState extends State<ChangePinScreen> {
//   late String newPin = '';
//   late String oldPin = '';
//   late String confirmedPin = '';
//   bool showPin = false;
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//
//     return Scaffold(
//       appBar: const CustomAppBar(
//         elevation: 0.2,
//         title: "Change PIN",
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: Insets.l),
//         child: Consumer<AuthProvider>(
//           builder: (BuildContext context, auth, child) => SizedBox(
//             height: context.heightPx - 65,
//             child: Column(children: [
//               const VSpace(80),
//               Align(
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Current PIN",
//                       style: TextStyles.body3.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: theme.black.withOpacity(0.6)),
//                     ),
//                     const HSpace(10),
//                     Icon(
//                       showPin ? FeatherIcons.eye : FeatherIcons.eyeOff,
//                       size: 20,
//                     ).clickable(() {
//                       showPin = !showPin;
//                       setState(() {});
//                     }),
//                   ],
//                 ),
//               ),
//               const VSpace(15),
//               SizedBox(
//                 width: 272,
//                 child: Pinput(
//                   onChanged: (pin) {
//                     oldPin = pin;
//                   },
//                   length: 4,
//                   obscureText: !showPin,
//                   defaultPinTheme: PinTheme(
//                     width: 56,
//                     height: 56,
//                     textStyle: TextStyle(
//                       fontSize: 20,
//                       color: theme.pinTextColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     decoration: BoxDecoration(
//                       color: theme.bg2,
//                       border:
//                           Border.all(color: theme.primary.withOpacity(0.25)),
//                       borderRadius: Corners.s5Border,
//                     ),
//                   ),
//                   focusedPinTheme: PinTheme(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: theme.cyan),
//                       borderRadius: Corners.s10Border,
//                     ),
//                   ),
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 ),
//               ),
//               const VSpace(16),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "New PIN",
//                   style: TextStyles.body3.copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: theme.black.withOpacity(0.6)),
//                 ),
//               ),
//               const VSpace(10),
//               SizedBox(
//                 width: 272,
//                 child: Pinput(
//                   onChanged: (pin) {
//                     newPin = StringConverter.stringSwitcher(pin);
//                   },
//                   length: 4,
//                   obscureText: !showPin,
//                   defaultPinTheme: PinTheme(
//                     width: 56,
//                     height: 56,
//                     textStyle: TextStyle(
//                       fontSize: 20,
//                       color: theme.pinTextColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     decoration: BoxDecoration(
//                       color: theme.bg2,
//                       border:
//                           Border.all(color: theme.primary.withOpacity(0.25)),
//                       borderRadius: Corners.s5Border,
//                     ),
//                   ),
//                   focusedPinTheme: PinTheme(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: theme.cyan),
//                       borderRadius: Corners.s10Border,
//                     ),
//                   ),
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 ),
//               ),
//               const VSpace(16),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Confirm new PIN",
//                   style: TextStyles.body3.copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: theme.black.withOpacity(0.6)),
//                 ),
//               ),
//               const VSpace(10),
//               SizedBox(
//                 width: 272,
//                 child: Pinput(
//                   onChanged: (pin) {
//                     confirmedPin = StringConverter.stringSwitcher(pin);
//                   },
//                   validator: (pin) {
//                     if (newPin != confirmedPin) {
//                       return 'pin does not match';
//                     } else {
//                       return null;
//                     }
//                   },
//                   length: 4,
//                   obscureText: !showPin,
//                   defaultPinTheme: PinTheme(
//                     width: 56,
//                     height: 56,
//                     textStyle: TextStyle(
//                       fontSize: 20,
//                       color: theme.pinTextColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     decoration: BoxDecoration(
//                       color: theme.bg2,
//                       border:
//                           Border.all(color: theme.primary.withOpacity(0.25)),
//                       borderRadius: Corners.s5Border,
//                     ),
//                   ),
//                   focusedPinTheme: PinTheme(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: theme.cyan),
//                       borderRadius: Corners.s10Border,
//                     ),
//                   ),
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 ),
//               ),
//               const VSpace(40),
//               PrimaryButton(
//                 onPressed: () {
//                   if (newPin == '' || newPin.isEmpty) {
//                     context.showInAppNotification('You must enter your pin');
//                   } else {
//                     String convertedStr = StringConverter.toBase64(newPin);
//
//                     PinCmd(context).updatePin({
//                       "pin": convertedStr,
//                     }, pin: convertedStr);
//
//                     newPin = '';
//
//                     log('setUpPinScreen class: line 71::... please wait unlocking ');
//                   }
//                 },
//                 label: R.S.createPin.toTitleCase(),
//                 color: theme.primary,
//                 fullWidth: true,
//                 // loading: wallet.isLoading,
//                 radius: 5,
//               ),
//               const VSpace(30),
//               Wrap(children: [
//                 Text(
//                   R.S.forgotPin,
//                   style: TextStyles.body3.copyWith(fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   R.S.resetPin,
//                   style: TextStyles.body3
//                       .copyWith(color: theme.blue, fontWeight: FontWeight.w600),
//                 )
//               ]).rippleClick(() {
//                 PinCmd(context).sendPinResetLink();
//               }),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
