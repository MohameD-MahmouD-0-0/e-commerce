import 'dart:convert';

import 'package:ecommerce/data/api/Api_Url.dart';
import 'package:ecommerce/data/model/reques/Register_Request.dart';
import 'package:ecommerce/data/model/response/Register_Rsponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  static Future<RegisterResponse> register(String Name, String Phone, String Email, String Password,
      String RePassword, String) async {
    Uri url = Uri.https(ApiUrl.baseUrl, ApiUrl.RegisterUrl);
    var requestBody = RegisterRequest(
        email: Email,
        name: Name,
        password: Password,
        phone: Phone,
        rePassword: RePassword);
    var response = await http.post(url, body: requestBody.toJson());
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return RegisterResponse.fromJson(json);
  }
}
