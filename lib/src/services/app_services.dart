import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:admin/src/components/my_toast/my_toast.dart';
import 'package:admin/src/utility/app_theme.dart';
import 'package:http/http.dart' as http;
import 'package:admin/src/utility/app_setting.dart';

class AppService {

  static Future callService({
    required ActionType actionType,
    required String apiName,
    required body}) async {
    var apiUrl = Uri.parse("${AppSetting.serviceURL}${AppSetting.globalLang}/api/$apiName");

    var header = {
      "content-type": 'application/json',
      "Accept": 'application/json, text/plain, /',
    };

    // if (!checkIfNotLogin(apiUrl.toString())) {
    //   String? token = await getStoredToken();
    //   if (token != null) {
    //     header.update('Authorization', (value) => "bearer $token",
    //         ifAbsent: () => "bearer $token");
    //   }
    // }

    dev.log(apiUrl.toString() , name: "URL");
    dev.log(json.encode(header).toString() , name: "HEADER");
    dev.log( json.encode(body).toString() ,name: "BODY");

    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response response = actionType == ActionType.get
            ? await http.get(apiUrl, headers: header)
            : await http.post(apiUrl, headers: header, body: json.encode(body));

        dev.log(response.statusCode.toString() , name: "STATUS CODE");
        dev.log(response.body.toString() , name: "RESULT");

        /// USER UN AUTHORIZE
        if (response.statusCode == 401) {
          /// DO SOMETHING
          return null;
        } else {
          if(jsonDecode(response.body)["State"] && response.statusCode == 200){
            return response.body;
          }else{
            showToast(msg: jsonDecode(response.body)["Message"][0]["Value"], backgroundColor: AppColors.red);
          }
        }

      } else {
        return null;
      }} catch (message){
      dev.log(message.toString() , name: "CATCH ERROR");
      return null ;
    }
  }

  // static getStoredToken() async {
  //   String? storedToken =
  //   await AppLocalStore.getString(LocalStoreNames.appToken);
  //   if (storedToken != null) {
  //     var token = jsonDecode(storedToken);
  //
  //     return token["access_token"].toString();
  //   } else {
  //     return null;
  //   }
  // }

}


enum ActionType { get, post }

