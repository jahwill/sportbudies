// import 'package:flutter/material.dart';
// import 'package:telneting_pro/export.dart';
//
// class ChangePhoneNumberScreen extends StatefulWidget {
//   const ChangePhoneNumberScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChangePhoneNumberScreen> createState() =>
//       _ChangePhoneNumberScreenState();
// }
//
// class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Change Phone Number",
//         leadingIconColor: theme.background,
//         backgroundColor: theme.background,
//         elevation: 1,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: Insets.l),
//         child: Consumer<AuthProvider>(
//           builder: (BuildContext context, auth, child) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const VSpace(40),
//               Text(
//                 "Phone number",
//                 style: TextStyles.body2.copyWith(fontWeight: FontWeight.w600),
//               ),
//               const VSpace(10),
//               const CustomFormTextInput(
//                 hintText: '0811234',
//               ),
//               const VSpace(30),
//               const PrimaryButton(
//                 label: 'Proceed',
//                 radius: 4,
//                 fullWidth: true,
//                 contentPadding: EdgeInsets.symmetric(vertical: 17),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ConfirmChangePhoneNumberScreen extends StatelessWidget {
//   const ConfirmChangePhoneNumberScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AppTheme theme = context.watch();
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: "Change Phone Number",
//       ),
//       body: CustomContainer(
//         // shadows: Shadows.universal,
//         color: Theme.of(context).colorScheme.background,
//         borderRadius: BorderRadius.circular(20),
//         height: context.heightPx * 0.86,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: Insets.l),
//           child: Column(children: [
//             const VSpace(79),
//             SvgIcon(
//               R.png.lockCircle.svg,
//               size: 80,
//               color: theme.primary,
//             ),
//             const VSpace(24.0),
//             Text(
//               'Enter your 4-digit Telneting PIN to change your phone number',
//               textAlign: TextAlign.center,
//               style: TextStyles.body2.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const VSpace(22.0),
//             SizedBox(
//               width: 272,
//               child: Pinput(
//                 onChanged: (pins) {
//                   // print(pin);
//                   // pin = pins;
//                 },
//                 length: 4,
//                 obscureText: true,
//                 defaultPinTheme: PinTheme(
//                   width: 56,
//                   height: 56,
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     color: theme.pinTextColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   decoration: BoxDecoration(
//                     color: theme.bg2,
//                     border: Border.all(color: theme.primary.withOpacity(0.4)),
//                     borderRadius: Corners.s5Border,
//                   ),
//                 ),
//                 focusedPinTheme: PinTheme(
//                   width: 45,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: theme.cyan),
//                     borderRadius: Corners.s10Border,
//                   ),
//                 ),
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               ),
//             ),
//             const VSpace(67.0),
//             PrimaryButton(
//               onPressed: () {
//                 // if (pin == '' || pin.isEmpty) {
//                 //   context.showInAppNotification('You must enter a proper pin');
//                 // } else {
//                 //   // String convertedStr = StringConverter.toBase64(pin);
//                 //   // context.pop(convertedStr);
//                 //   // pin = '';
//                 //   TelnetBottomSheet.openBottomSheet(
//                 //     sizeFraction: 0.58,
//                 //     this.context,
//                 //     addCloseIcon: false,
//                 //     const SuccessPurchaseItem(),
//                 //   );
//                 // }
//               },
//               label: "Confirm",
//               color: Theme.of(context).primaryColor,
//               fullWidth: true,
//               radius: 4,
//               // contentPadding: ,
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
