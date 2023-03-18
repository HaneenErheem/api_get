import 'dart:convert';

import 'package:api_android/api/api_settings.dart';
import 'package:api_android/models/base_api_response.dart';
import 'package:api_android/models/users.dart';

import 'package:http/http.dart 'as http;

class UserApiController{
  Future<List<User>>readUsers()async{
    var uri= Uri.parse(ApiSettings.readUsers);
    var response= await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse=jsonDecode(response.body);
      //هان بعطيه كل الجيسون اللي اجاني نم الاي بي اي  
      BaseApiResponse baseApiResponse =BaseApiResponse.fromJson(jsonResponse);
      return baseApiResponse.data;
    }
      return[];

  }
}