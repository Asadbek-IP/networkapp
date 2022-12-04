import 'dart:convert';

import 'package:http/http.dart';
import 'package:networkapp/model/emp_list.dart';
import 'package:networkapp/model/model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String apiList = '/posts';

  static Future<EmpList> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);

    var response = await get(uri, headers: headers);

   
      return EmpList.fromjson(jsonDecode(response.body));
    
    
  }

  static Future<String> Post(
      {String? api, Map<String, dynamic>? params}) async {
    var uri = Uri.https(BASE, api!);

    var response = await post(uri, headers: headers, body: jsonEncode(params));

    if (response.statusCode == 201) {
      return response.body;
    }
    return response.statusCode.toString();
  }

  static Future<String> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);

    var response = await put(uri, headers: headers, body: jsonEncode(params));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else
      return "Xatoo";
  }

  static Future<String> DELETE(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);

    var response =
        await delete(uri, headers: headers, body: jsonEncode(params));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    }
    return "Xatoo";
  }


}
