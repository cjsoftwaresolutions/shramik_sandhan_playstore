// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:get/instance_manager.dart';
// import 'package:shramic_sandhan/controller/base_controller.dart';
// import 'package:shramic_sandhan/controller/roles_controler.dart';
// import 'package:shramic_sandhan/custom_widgets/custom_snackbar.dart';
// import 'package:shramic_sandhan/repo/sign_up_repo.dart';
// import 'package:shramic_sandhan/utils/api_endpoints.dart';
// import 'package:shramic_sandhan/utils/app.dart';
// import 'package:shramic_sandhan/utils/preferance_helper.dart';
// import 'package:shramic_sandhan/utils/utilities.dart';
// import 'package:shramic_sandhan/view/home.dart';
// import 'package:shramic_sandhan/view/sign_in.dart';
// import 'package:shramik_sandhan_playstore/sign_in/sign_up_repo.dart';
// import 'language_controller.dart';
//
// class SignInController extends BaseController{
//   SignInController(this._signUpRepository);
//   final SignUpRepository _signUpRepository;
//   late RolesController rolesController;
//  // LanguageController languageController = Get.find();
//
//   late TextEditingController userMobileController;
//   late TextEditingController userPasswordController;
//   late TextEditingController otpController;
//
//   RxBool isObscure = true.obs;
//
//   var passwordOtpLabel = 'Password'.obs;
//   var isOTPVisibility = false.obs;
//
//   RxBool isLoading = false.obs;
//
//   Future onSignInClick(context)async {
//     rolesController.language = 'telugu';
//     if (languageController.speechToTextLocale == 'en') {
//       rolesController.language = 'english';
//     } else if (languageController.speechToTextLocale == 'hi') {
//       rolesController.language = 'hindi';
//     }
//     if(rolesController.roleId.value == -1){
//       CustomSnackBar.showSnackBar(
//           "Type of user:".tr, "This field is required".tr);
//     }else if (userMobileController.text.isEmpty) {
//       CustomSnackBar.showSnackBar(
//           'Phone Number'.tr, 'This field is required'.tr);
//     } else if (userMobileController.text.length != 10) {
//       CustomSnackBar.showSnackBar(
//           'Phone Number'.tr, 'Phone number must be 10 digits'.tr);
//     } else if (verifyChoose == VerifyChoose.password.obs &&
//         userPasswordController.text.isEmpty) {
//       CustomSnackBar.showSnackBar("Password".tr, "This field is required".tr);
//     }
//     else if (verifyChoose == VerifyChoose.password.obs &&
//         userPasswordController.text.isNotEmpty &&
//         userPasswordController.text.length < 6) {
//       CustomSnackBar.showSnackBar(
//           "Password".tr, "Password length must be greater than 5".tr);
//     }else if(verifyChoose == VerifyChoose.otp.obs && otpController.text.isEmpty){
//       CustomSnackBar.showSnackBar("OTP".tr, "This field is required".tr);
//     }
//     else if(verifyChoose== VerifyChoose.otp.obs && otpController.text.isNotEmpty && otpController.text.length != 6){
//       CustomSnackBar.showSnackBar(
//           "OTP".tr, "OTP length must be 6 digits".tr);
//     }
//     else {
//       isLoading.value = true;
//       var json = {};
//       var endPoint = '';
//       if(verifyChoose == VerifyChoose.otp.obs){
//         endPoint = apiEndPoint.verifyMessage;
//
//         json = {
//           'role_id': '${rolesController.roleId}',
//           'mobile_number' : await userMobileController.text.encrypt(),
//           'otp': otpController.text,
//           'lang': rolesController.language // using lang keyword we get the address values from address ids in backend
//         };
//       } else {
//         endPoint = apiEndPoint.login;
//         json = {
//           'user_type_id': '${rolesController.roleId}',
//           'user_mobile': await userMobileController.text.encrypt(),
//           'user_password': userPasswordController.text,
//           'lang': rolesController.language // using lang keyword we get the address values from address ids in backend
//         };
//       }
//       return _signUpRepository.signInResponse(json, rolesController.roleId, endPoint).then((value) async {
//         isLoading.value = false;
//         printLog('success login value $value');
//         if (value != null && value.status == 'success') {
//           final data = value.response.data;
//
//           await writeIntoStorage("accessToken", value.response.tokens.accessToken);
//           await writeIntoStorage("refreshToken", value.response.tokens.refreshToken);
//           languageController.accessToken = value.response.tokens.accessToken;
//           printLog('success login ${data.toString}');
//           printLog('success login user id ${data.id}');
//
//          /* SignInAdapter signInAdapter = SignInAdapter(
//             data.fullName,
//             data.phoneNumber,
//             data.fatherName,
//             true,
//             languageController.speechToTextLocale,
//             data.id,
//           );*/
//           // await saveUserSignInDataToDB(signInAdapter);
//           // await saveUserDataToDb(data);
//           // await languageController.initData();  // update the user data in language controller
//           printLog('userId signIn ${languageController.userId}');
//          /* FirebaseMessage().generateAndSendFirebaseToken(signUpRepository: _signUpRepository,
//               roleId: rolesController.roleId, userId: languageController.userId);*/
//           appExt.push(const Home(), context);
//           // return value;
//         }else if(verifyChoose == VerifyChoose.otp.obs) {
//           CustomSnackBar.showSnackBar('Sign In'.tr, 'Please check your otp'.tr);
//         }else{
//           CustomSnackBar.showSnackBar('Sign In'.tr, 'Please check your phone number and password'.tr);
//         }
//       });
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     printLog('SignInController onInit');
//     userMobileController = TextEditingController();
//     userPasswordController = TextEditingController();
//     otpController = TextEditingController();
//     rolesController = Get.put(RolesController(_signUpRepository));
//     onLanguageSelection(LanguageCheck.telugu, 'te');
//   }
//
//   @override
//   void dispose() {
//     userPasswordController.dispose();
//     userMobileController.dispose();
//     otpController.dispose();
//     super.dispose();
//   }
//
//
//   Dio _dio() {
//     final options = BaseOptions(
//       // baseUrl: 'http://35.228.10.19/api/',
//       // baseUrl: 'https://shramicsandhan.herokuapp.com/api/',
//       // baseUrl: 'https://35.228.10.19/api/',
//         baseUrl: 'https://www.cjsoftwaresolution.com/api/'
//
//     );
//
//     var dio = Dio(options);
//     dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
//     if(!kIsWeb) {
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//           (HttpClient client) {
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//         return client;
//       };
//     }
//     //dio.interceptors.add(LoggingInterceptor());
//     /*dio.interceptors.add(RetryInterceptor(
//         options: const RetryOptions(
//           retries: 3, // Number of retries before a failure
//           retryInterval: Duration(seconds: 1), // Interval between each retry
//           retryEvaluator: (error) => error.type != DioErrorType.cancel && error.type != DioErrorType.response, // Evaluating if a retry is necessary regarding the error. It is a good candidate for updating authentication token in case of a unauthorized error (be careful with concurrency though)
//         )
//     ));*/
//
//     dio.interceptors.add(InterceptorsWrapper(
//         onRequest:(options, handler) async{
//           // Do something before request is sent
//           // dio.options.headers.addAll({'Authorization': 'Bearer ${await readFromStorage("accessToken")}'});
//           // printLog('interceptors onrequest queryParameters ${options.queryParameters}');
//           printLog('interceptors onrequest uri ${options.uri}');
//           printLog('interceptors onrequest data ${options.data}');
//
//           // printLog('interceptors request header ${await readFromStorage("accessToken")}');
//           options.contentType ??=  'application/x-www-form-urlencoded';
//           return handler.next(options); //continue
//           // If you want to resolve the request with some custom data，
//           // you can resolve a `Response` object eg: `handler.resolve(response)`.
//           // If you want to reject the request with a error message,
//           // you can reject a `DioError` object eg: `handler.reject(dioError)`
//         },
//         onResponse:(response,handler) {
//           printLog('interceptors dio_response $response');
//           // Do something with response data
//           return handler.next(response); // continue
//           // If you want to reject the request with a error message,
//           // you can reject a `DioError` object eg: `handler.reject(dioError)`
//         },
//         onError: (DioError error, handler) async {
//           printLog('interceptors dio_error response ${error.response}');
//
//           if(error.requestOptions.contentType == 'application/x-www-form-urlencoded'){
//
//             if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
//               await refreshToken(dio).then((value) async{
//                 if(value){
//                   dio.options.headers.addAll({'Authorization': 'Bearer ${await readFromStorage("accessToken")}'});
//                   final options = Options(
//                     method: error.requestOptions.method,
//                   );
//                   final response = await dio.request(
//                     error.requestOptions.path,
//                     cancelToken: error.requestOptions.cancelToken,
//                     data: error.requestOptions.data,
//                     onReceiveProgress: error.requestOptions.onReceiveProgress,
//                     onSendProgress: error.requestOptions.onSendProgress,
//                     queryParameters: error.requestOptions.queryParameters,
//                     options: options,
//                   );
//                   handler.resolve(response);
//                 } else {
//                   CustomSnackBar.showSnackBar('Error', 'Something went wrong please login again');
//                   Get.to(SignIn());
//                 }
//               });
//               // If you want to resolve the request with some custom data，
//               // you can resolve a `Response` object eg: `handler.resolve(response)`.
//             }
//             else if (error.response?.statusCode == 000){
//               //appExt.push(const SignIn(), context);
//               // printLog('dio_error_statusCode_2 ${error.response?.statusCode}');
//
//               clearFromStorage();
//               Get.to(SignIn());
//             } else if (error.response?.statusCode == 413){
//               // printLog('dio 413 error');
//               return handler.next(error);
//             }
//           } else {  // Form-data
//             // printLog('header formdata entered');
//             return handler.next(error);
//           }
//         }));
//
//     return dio;
//   }
//
// }