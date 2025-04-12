import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_constant.dart';
import 'package:ecommerce/data/model/reques/LoginRequest.dart';
import 'package:ecommerce/data/model/reques/Register_Request.dart';
import 'package:ecommerce/data/model/response/AddToCartResponseDto.dart';
import 'package:ecommerce/data/model/response/BrandesResponseDto.dart';
import 'package:ecommerce/data/model/response/CategoryResponseDto.dart';
import 'package:ecommerce/data/model/response/LoginResponseDto.dart';
import 'package:ecommerce/data/model/response/ProductResponseDto.dart';
import 'package:ecommerce/data/model/response/Register_Rsponse_Dto.dart';
import 'package:ecommerce/data/model/response/ResponseCartDto.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/ui/utils/Shared_prefrence_utils.dart';
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
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.RegisterUrl);
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
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.LoginerUrl);
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

  Future<Either<Failer,CategoryResponseDto>> getAllCategory() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AllCategoryUrl);
      var response = await http.post(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      var categoryResponse = CategoryResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300)
      {

        return Right(categoryResponse);
      } else
      {
        return Left(Failer(errorMessage: categoryResponse.message!));
      }
    }
    return Left(Failer(errorMessage: "Connection Error"));
  }

  Future<Either<Failer,BrandesResponseDto>> getAllBrandes() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AllBrandesUrl);
      var response = await http.post(url);
      var responseString = response.body.toString();
      var json = jsonDecode(responseString);
      var brandesResponse = BrandesResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300)
      {
        return Right(brandesResponse);
      } else
      {
        return Left(Failer(errorMessage: brandesResponse.message!));
      }
    }
    return Left(Failer(errorMessage: "Connection Error"));
  }

  Future<Either<Failer,ProductResponseDto>> getAllProduct()async{
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AllProductUrl);
       var response = await http.get(url);
       var responsebody = response.body;
       var json = jsonDecode(responsebody);
       var productResponse = ProductResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      }
      else {
        return Left(Failer(errorMessage:'Product Response Problem'));
      }
    }
    return Left(Failer(errorMessage: 'Connection Error'));
  }

  Future<Either<Failer,AddToCartResponseDto>> addToCart(String productId)async{
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AddToCarUrl);
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response = await http.post(url,body: {
        'productId': productId},
          headers: {'token': token.toString()});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var addToCartResponse = AddToCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      }else if(response.statusCode==401){
        return Left(Failer(errorMessage: addToCartResponse.message!));
      }
      else {
        return Left(Failer(errorMessage:addToCartResponse.message!));
      }
    }
    return Left(Failer(errorMessage: 'Proplem connection '));
  }

  Future<Either<Failer,ResponseCartDto>> getCartItem()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.GetCartItemUrl);
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var getCartItem = ResponseCartDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartItem);
      }else if(response.statusCode==401){
        return Left(Failer(errorMessage: getCartItem.status!));
      }
      else {
        return Left(Failer(errorMessage:getCartItem.status!));
      }
    }
    return Left(Failer(errorMessage: 'Proplem connection '));
  }

}