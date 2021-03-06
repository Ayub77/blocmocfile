// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:blocmocfile/model/contactModel.dart';
import 'package:http/http.dart';

class Network {
  static String BASE = "62639feb005a66e1e3b5aa53.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json'};

  /* Http Apis */

  static String API_LIST = "/api/contacts";
  static String API_LIST_ID = "/api/contacts/";//id
  static String API_CREATE = "/api/contacts";
  static String API_UPDATE = "/api/contacts/"; //{id}
  static String API_DELETE = "/api/contacts/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> GETID(String api,String id, Map<String, String> params) async {
    var uri = Uri.https(BASE, api+"/"+id, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Contacts contact) { 
    return contact.toJson();
  }

  // static Map<String, String> paramsUpdate(Post post) {
  //   Map<String, String> params = new Map();
  //   params.addAll({
  //     'id': post.id.toString(),
  //     'title': post.title,
  //     'body': post.body,
  //     'userId': post.userId.toString(),
  //   });
  //   return params;
  // }



  static List<Contacts> parsePostList(String respons){
    dynamic json = jsonDecode(respons);
    var data = List<Contacts>.from(json.map((x)=>Contacts.fromJson(x)));
    return data; 
  }

}