// import 'package:flutter/material.dart';
// import 'package:shramik_sandhan_playstore/sign_in/sign_in_controller.dart';
// import 'package:shramik_sandhan_playstore/sign_in/sign_up_repo.dart';
//
// class SignIn extends StatelessWidget {
//   SignIn({Key? key}) : super(key: key);
//   SignInController signInController = SignInController(SignUpRepository(Get.find()));
//   @override
//   Widget build(BuildContext context) {
//     //signInController.onInitData();
//     print('SignInController onInit');
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white60, Colors.white70],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ), child: Center(
//           child:SingleChildScrollView(
//               child:Column(
//                   children: [
//                     Obx(() {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Radio<LanguageCheck>(
//                               value: LanguageCheck.telugu,
//                               groupValue: signInController.languageCheck.value,
//                               onChanged: (LanguageCheck? value) async{
//                                 signInController.onLanguageSelection(value, 'te');
//                               }),
//                           Text('తెలుగు'.tr),
//                           Radio<LanguageCheck>(
//                               value:LanguageCheck.english,
//                               groupValue: signInController.languageCheck.value,
//                               onChanged: (LanguageCheck? value) async {
//                                 signInController.onLanguageSelection(value, 'en');
//                               }),
//                           Text('English'.tr),
//                           Radio<LanguageCheck>(
//                               value: LanguageCheck.hindi,
//                               groupValue:signInController.languageCheck.value,
//                               onChanged: (LanguageCheck? value) async {
//                                 signInController.onLanguageSelection(value, 'hi');
//                               }),
//                           Text('हिन्दी'.tr)
//                         ],
//                       );
//                     }
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Obx(() {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.fromLTRB(
//                                   0, 0, 0, 8),
//                               child: Text('Welcome'.tr,
//                                 style: const TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 24,
//                                 ),
//                               ),
//                             ),
//                             Obx(() {
//                               if (signInController.rolesController
//                                   .roleDropdownList.isNotEmpty) {
//                                 return DropDownWidget(
//                                   previousValue: signInController
//                                       .rolesController.roleValue.value,
//                                   dropdownList: signInController
//                                       .rolesController.roleDropdownList,
//                                   onValueChanged:
//                                       (FormModel formModel) =>
//                                       signInController.rolesController
//                                           .onChangeRoleDropdown(
//                                           formModel),
//                                 );
//                               } else {
//                                 return const SizedBox(
//                                   child: CircularProgressIndicator(),
//                                   height: 20.0,
//                                   width: 20.0,);
//                               }
//                             }),
//                             const SizedBox(height: 8,),
//                             Row(
//                               children: [
//                                 Obx(() {
//                                   return Radio<VerifyChoose>(
//                                       value: VerifyChoose.password,
//                                       groupValue: signInController
//                                           .verifyChoose
//                                           .value,
//                                       onChanged: (
//                                           VerifyChoose? value) async {
//                                         signInController.verifyChoose
//                                             .value =
//                                             value ??
//                                                 VerifyChoose.password;
//                                         signInController.passwordOtpLabel
//                                             .value =
//                                         "Password";
//                                       });
//                                 }),
//                                 Text('Password'.tr),
//                                 Obx(() {
//                                   return Radio<VerifyChoose>(
//                                       value: VerifyChoose.otp,
//                                       groupValue: signInController
//                                           .verifyChoose
//                                           .value,
//                                       onChanged: (
//                                           VerifyChoose? value) async {
//                                         signInController.verifyChoose
//                                             .value =
//                                             value ?? VerifyChoose.otp;
//                                         signInController.isOTPVisibility
//                                             .value =
//                                             value == VerifyChoose.otp;
//                                         signInController.passwordOtpLabel
//                                             .value =
//                                         "O.T.P";
//                                       });
//                                 }),
//                                 Text("O.T.P".tr),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: CustomTextField(
//                                     labelText: 'Phone Number'.tr,
//                                     iconData: Icons.person,
//                                     textEditingController: signInController
//                                         .userMobileController,
//                                     textToSpeechLocale: signInController
//                                         .languageController
//                                         .speechToTextLocale,
//                                     maxLength: 10,
//                                     keyboardType: TextInputType.number,
//                                   ),
//                                 ),
//                                 /*Obx(() {
//                                   return Visibility(
//                                     visible: signInController
//                                         .verifyChoose.value ==
//                                         VerifyChoose.otp,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left:4,top: 4,bottom: 10),
//                                       child: MaterialButton(
//                                         onPressed: () {
//                                           signInController.onSendOTPClick(
//                                               context);
//                                         },color:Colors.blue,
//                                         child: Text("Send OTP".tr,
//                                             style: const TextStyle(
//                                                 fontSize: 10,color: Colors.white)),
//                                       ),
//                                     ),
//                                   );
//                                 }
//                                 ),*/
//                               ],
//                             ),
//                             Obx(() {
//                               return CustomTextField(
//                                   labelText: signInController
//                                       .passwordOtpLabel.value.tr,
//                                   iconData: Icons.lock_outline,
//                                   textEditingController: signInController
//                                       .passwordOtpLabel.value == "Password"
//                                       ? signInController
//                                       .userPasswordController
//                                       : signInController.otpController,
//                                   textToSpeechLocale: signInController
//                                       .languageController
//                                       .speechToTextLocale,
//                                   isObscure: signInController.isObscure.value,
//                                   iconButton: IconButton(
//                                       onPressed: () {
//                                         signInController.isObscure.value = !signInController.isObscure.value;
//                                       },
//                                       icon: Icon(signInController.isObscure.value
//                                           ? Icons.visibility_off
//                                           : Icons.visibility,)));
//                             }),
//                             Row(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: [
//                                   MaterialButton(onPressed: () {
//                                     signInController.onSignInClick(context);
//                                   },
//                                     textColor: Colors.blue,
//                                     color: Colors.white,
//                                     child: Text('Sign In'.tr,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 16,),
//                                  /* MaterialButton(
//                                     onPressed: () async {
//                                       LocationPermission permission;
//                                       permission = await Geolocator.checkPermission();
//                                       if (permission == LocationPermission.denied) {
//                                         permission = await Geolocator.requestPermission();
//                                       }
//                                       Geolocator.getCurrentPosition().then((value)  {
//                                         if (signInController
//                                             .checkInternetConnection) {
//                                           appExt.push(
//                                               const SignUp(), context);
//                                         } else {
//                                           Get.snackbar(
//                                               'please check your internet connection',
//                                               'Internet Connectivity');
//                                         }
//                                       });
//
//                                     },
//                                     textColor: Colors.blue,
//                                     color: Colors.white,
//                                     child: Text("Create New Account".tr,
//                                     ),
//                                   )*/
//                                 ]),
//                             const SizedBox(height: 16,),
//                             signInController.isLoading.value ? const CircularProgressIndicator() : const SizedBox()
//                             /* MaterialButton(onPressed: (){
//                                    appExt.push(const Password(), context);
//                                  },
//                                    textColor: Colors.blue,
//                                    color: Colors.white,
//                                    child: Text('Forget password'.tr),
//                                  )*/
//                           ],
//                         );
//                       }
//                       ),
//                     ),
//                   ]))),
//       ),
//     );
//   }
// }
//
// enum LanguageCheck { english, telugu, hindi }
// enum VerifyChoose { otp, password }
//
