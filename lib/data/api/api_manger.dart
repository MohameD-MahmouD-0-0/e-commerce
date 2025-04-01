import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_Url.dart';
import 'package:ecommerce/data/model/reques/LoginRequest.dart';
import 'package:ecommerce/data/model/reques/Register_Request.dart';
import 'package:ecommerce/data/model/response/LoginResponseDto.dart';
import 'package:ecommerce/data/model/response/Register_Rsponse_Dto.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/ui/authe/register/Cuibt/register_states.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  static ApiManger? _instance;

  ApiManger._();

  static ApiManger getInstance() {
    if (_instance == null) {
      _instance = ApiManger._();
    }
    {
      return _instance!;
    }
  }
  Future<Either<Failer, RegisterResponseDto>> register(
      String Name, String Phone, String Email,
      String Password, String RePassword) async
  {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    Uri url = Uri.https(ApiUrl.baseUrl, ApiUrl.RegisterUrl);
    var requestBody = RegisterRequest(
        email: Email, name: Name, password: Password,
        phone: Phone, rePassword: RePassword);

    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.post(url, body: requestBody.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var registerResponse = RegisterResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(Failer(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message!));
      }
    } else {
      return Left(Failer(errorMessage: "Check Internet Connection"));
    }
  }

  Future<Either<Failer,LoginResponseDto>> login(String Email, String Password) async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiUrl.baseUrl, ApiUrl.LoginerUrl);
      var requestBody = LoginRequest(email: Email, password: Password);
      var response = await http.post(url, body: requestBody.toJson());
      var responseString = response.body.toString();
      var json = jsonDecode(responseString);
      var loginResponse = LoginResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300)
        {
          return Right(loginResponse);
        } else
      {
        return Left(Failer(errorMessage: loginResponse.message!));
      }
      }
    return Left(Failer(errorMessage: "Connection Error"));
  }
}