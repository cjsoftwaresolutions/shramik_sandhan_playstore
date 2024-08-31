//
// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:shramic_sandhan/controller/language_controller.dart';
// import 'package:shramic_sandhan/custom_widgets/custom_snackbar.dart';
// import 'package:shramic_sandhan/model/district_list.dart';
// import 'package:shramic_sandhan/model/house_owner_model.dart';
// import 'package:shramic_sandhan/model/labour_model_response.dart';
// import 'package:shramic_sandhan/model/mandal_list.dart';
// import 'package:shramic_sandhan/model/monopolist_model_response.dart';
// import 'package:shramic_sandhan/model/owner_model_response.dart';
// import 'package:shramic_sandhan/model/previous_work_photos_response.dart';
// import 'package:shramic_sandhan/model/profile_photo.dart';
// import 'package:shramic_sandhan/model/roles_list_model.dart';
// import 'package:shramic_sandhan/model/send_otp.dart';
// import 'package:shramic_sandhan/model/state_list.dart';
// import 'package:shramic_sandhan/model/success_response.dart';
// import 'package:shramic_sandhan/model/unemploye_model_response.dart';
// import 'package:shramic_sandhan/model/update_cards_response.dart';
// import 'package:shramic_sandhan/model/verify_otp.dart';
// import 'package:shramic_sandhan/model/village_list.dart';
// import 'package:shramic_sandhan/utils/api_endpoints.dart';
// import 'package:shramic_sandhan/utils/app.dart';
// import 'package:shramic_sandhan/utils/image_upload_util.dart';
// import 'package:shramic_sandhan/utils/preferance_helper.dart';
// import 'package:shramic_sandhan/utils/refresh_token.dart';
// import 'package:shramic_sandhan/view/sign_in.dart';
//
// class SignUpRepository {
//   final Dio _dio;
//
//   SignUpRepository(this._dio);
//
//   Future<dynamic> signInResponse(jsonBody, role, endPoint)  async {
//     _dio.options.contentType = 'application/x-www-form-urlencoded';
//     try{
//       var response = await _dio.post(endPoint, data: jsonBody);
//       if (response.statusCode == 200) {
//         log('role $role }');
//       }
//     } catch(e){
//       log('Login error $e');
//     }
//     return null;
//   }
//
//   // Future<SendOTP?> sendOTP (body) async {
//   //   _dio.options.contentType = 'application/x-www-form-urlencoded';
//   //   try{
//   //     var response = await _dio.post(apiEndPoint.sendOTP, data: body);
//   //     if (response.statusCode == 200) {
//   //       return SendOTP.fromJson(response.data);
//   //     } else {
//   //       return null;
//   //     }
//   //   } catch(e){
//   //     return null;
//   //   }
//   // }
//   //
//   // Future<VerifyOtp?> verifyOTP(body) async {
//   //   _dio.options.contentType = 'application/x-www-form-urlencoded';
//   //   try{
//   //     var response = await _dio.post(apiEndPoint.verifyOTP, data: body);
//   //     if (response.statusCode == 200) {
//   //       return VerifyOtp.fromJson(response.data);
//   //     } else {
//   //       return null;
//   //     }
//   //   } catch(e){
//   //     return null;
//   //   }
//   // }
// }