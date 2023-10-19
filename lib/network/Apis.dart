// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pickbazar_delivery/Utils/Constants.dart';
import 'package:pickbazar_delivery/helper/SharedPref.dart';
import 'package:pickbazar_delivery/network/Response/customerCards.dart';
import 'package:pickbazar_delivery/network/Response/signInRes.dart';
import 'package:pickbazar_delivery/network/Response/verifyOtpRes.dart';
import 'package:pickbazar_delivery/providers/ApiProvider.dart';
import 'package:provider/provider.dart' as provider;

class Apis {
  String BASE_URL = "dashboard.fastauth.net";
  late http.Response response;
  SharedPref? pref;
  BuildContext? _context;
  late ApiProvider _apiProvider;
  static Apis? _api;

  Apis._() {
    SharedPref.init().then((value) {
      _api?.pref = value;
    });
  }

  static Apis init([BuildContext? context]) {
    if (_api == null) {
      _api = Apis._();
      _api!._context = context;
      _api!._apiProvider =
          provider.Provider.of<ApiProvider>(_api!._context!, listen: false);
    }
    return _api!;
  }

  Map<String, String>? _getHeaders() {
    // var _headers = {"Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJhOWE2NTFiOS1iYjVmLTQ5ODEtYjdlYy1kNmU0Y2JlOTYwMjEiLCJpYXQiOjE2NjAyMTE2NzQsImV4cCI6MTY2MDIxNTI3NH0.rPZr55IY3otXgIqQcJK81UZ07wp-k1vX_3CuMyjYghQ"};
    // SharedPref.initializePreference().then((prefs){
    //   prefs.getHeaders().then((value){
    //     if(value.authorization.isEmpty){
    //       prefs.setHeaders(_headers);
    //       headers = jsonDecode(jsonEncode(_headers).toString());
    //     }else{
    //       headers = jsonDecode(jsonEncode(value).toString());
    //     }
    //   });
    // });
    //var token = _api?.pref?.retrieveUserInfo()?.statusmessage;
    var token = "";

    print("token: " + token.toString());

    if (token == null) {
      return {"Content-Type": "application/json"};
    }
    return {
      "x-api-key-secret": "base64:rLyGsFMugyejBFlRrSO1xOs9RiC5iQYDRiehDTwnMRo=",
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };
  }

  Future<http.Response> _getRequest(String api, [Map<String, String>? params]) {
    Future<http.Response>? _response;
    try {
      _response = http
          .get(Uri.https(BASE_URL, api, params), headers: _getHeaders())
          .timeout(const Duration(seconds: 15),
              onTimeout: () => http.Response('$api timeout', 408))
          .onError(
              (error, stackTrace) => http.Response("$api error: $error", 400));
    } finally {
      _response?.then((value) {
        if (value.statusCode == 200) {
          debugPrint("$api response: " + jsonDecode(value.body).toString(),
              wrapWidth: 1024);
        } else if (value.statusCode == 401) {
          //save user info
          //pref!.saveUserInfo(SignInResponse());
          print("$api no auth: ${value.body.toString()}");
        } else {
          print("$api error: ${value.body.toString()}");
        }
      });
    }
    return _response;
  }

  Future<http.Response> _postRequest(
      String api, Map<String, String> body) async {
    Future<http.Response>? _response;
    final String requestBodyJson = jsonEncode(body);

    try {
      _response = http
          .post(Uri.https(BASE_URL, api),
              headers: _getHeaders(),
              body: requestBodyJson)
          .timeout(const Duration(seconds: 15),
              onTimeout: () => http.Response('$api timeout', 408))
          .onError((error, stackTrace) =>
              http.Response("$api error: ${error.toString}", 400));
    } finally {
      _response?.then((value) {
        _apiProvider.showLoader(false);
        if (value.statusCode == 200) {
          print("$api response: " + jsonDecode(value.body).toString());
        } else if (value.statusCode == 401) {
          //save user info
          //pref!.saveUserInfo(SignInResponse());
          print("$api no auth: ${value.body.toString()}");
        } else {
          print("$api error: ${value.body.toString()}");
        }
      });
    }
    return _response;
  }

  // Future<SignInResponse> SignInUser(Map<String, String> params) async {
  //   response = await _postRequest(Constants.EP_SIGNIN, params);
  //   if (response.statusCode == 200) {
  //     return SignInResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return SignInResponse.error();
  //   }
  // }

  Future<AuthVerifyRes> VerifyUser(Map<String, String> params) async {
    response = await _postRequest(Constants.EP_AuthVerify, params);
    if (response.statusCode == 200) {
      return AuthVerifyRes.fromJson(jsonDecode(response.body));
    } else {
      return AuthVerifyRes.error();
    }
  }

   Future<VerifyOtpRes> VerifyPinCode(Map<String, String> params) async {
    response = await _postRequest(Constants.EP_VerifyOtp, params);
    if (response.statusCode == 200) {
      return VerifyOtpRes.fromJson(jsonDecode(response.body));
    } else {
      return VerifyOtpRes.error();
    }
  }

  Future<CustomerAllCards> FetchAllCards(Map<String, String> params) async {
    response = await _postRequest(Constants.EP_GetCards, params);
    if (response.statusCode == 200) {
      return CustomerAllCards.fromJson(jsonDecode(response.body));
    } else {
      return CustomerAllCards.error();
    }
  }

  // Future<SignupResponse> SignUpUser(Map<String, String> params) async {
  //   response = await _postRequest(Constants.EP_SIGNUP, params);

  //   if (response.statusCode == 200) {
  //     return SignupResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return SignupResponse.error();
  //   }
  // }
}
