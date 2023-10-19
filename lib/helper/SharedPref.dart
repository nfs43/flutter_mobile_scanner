import 'dart:convert';
import 'dart:core';


import 'package:pickbazar_delivery/network/Headers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  SharedPreferences? _preferences;
  static SharedPref? _pref;

  static Future<SharedPref> init() async {
    if (_pref == null) {
      _pref = SharedPref._();
      _pref!._preferences = await SharedPreferences.getInstance();
    }
    return Future(() => _pref!);
  }

  Headers getHeaders() {
    String? headers = _pref!._preferences!.getString('headers');
    if (headers == null) {
      return Headers();
    }
    Map<String, String> decoded = Map<String, String>.from(jsonDecode(headers));
    return Headers.fromJson(decoded);
  }

  Future<void> setHeaders(Map<String, String> headers) async {
    String encoded = jsonEncode(headers);
    await _pref!._preferences!.setString('headers', encoded);
  }

  // Future<String> getFavoriteStores() async {
  //   String? result = this._pref!.preferences!.getString('data');
  //   Map<String, dynamic> decoded = jsonDecode(result!);
  //   return StoreList.fromJson(decoded);
  // }

  // Future<void> saveUserInfo(CustomerData? data) async {
  //   String customerData = jsonEncode(data?.toJson());
  //   print('Data:: ' + customerData);
  //   await _pref!._preferences!.setString('CustomerData', customerData);
  // }

  // CustomerData? retrieveUserInfo() {
  //   String? result = _pref?._preferences?.getString('CustomerData');
  //   if (result != null) {
  //     Map<String, dynamic> decoded = jsonDecode(result);
  //     return CustomerData.fromJson(decoded);
  //   } else {
  //     return CustomerData.error();
  //   }
  // }

   bool isUserExist() {
    String? result = _pref?._preferences?.getString('CustomerData');
    if (result != null) {
      return true;
    } else {
      return false;
    }
  }

  // Future<String> getCurrentUserID() async {
  //   String? result = this._pref!.preferences!.getString('data');
  //   Map<String, dynamic> decoded = jsonDecode(result!);
  //   print('Usesdasd' + Login_Response.fromJson(decoded).user_id.toString());
  //   return Login_Response.fromJson(decoded).user_id.toString();
  // }

  // Future<String> getToken() async {
  //   String? result = this._pref!.preferences!.getString('data');
  //   Map<String, dynamic> decoded = jsonDecode(result!);
  //   return Login_Response.fromJson(decoded).token;
  // }

  // bool isUserExist() {
  //   if (this._pref!.preferences!.containsKey('data')) {
  //     print('user exist');
  //     return true;
  //   } else {
  //     print('user not exist');
  //     return false;
  //   }
  // }

  bool isIntroSkipped() {
    if (_pref!._preferences!.containsKey('skip')) {
      print('exist');
      return true;
    } else {
      print('not exist');
      return false;
    }
  }

  Future<void> saveIntroSkip(String skip) async {
    await _pref!._preferences!.setString('skip', skip);
  }

  Future<String?> getName() async {
    String? result = _pref!._preferences!.getString('name');
    return result;
  }

  Future<String?> getImage() async {
    String? result = _pref!._preferences!.getString('image');
    return result;
  }

  Future<void> saveName(String? name) async {
    await _pref!._preferences!.setString('name', name!);
  }

  Future<void> clearSharedPreferences() async {
    _pref!._preferences!.clear();
  }
}
