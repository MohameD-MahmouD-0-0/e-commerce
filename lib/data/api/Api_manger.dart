import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_constant.dart';
import 'package:ecommerce/data/model/reques/LoginRequest.dart';
import 'package:ecommerce/data/model/reques/Register_Request.dart';
import 'package:ecommerce/data/model/response/AddToCartResponseDto.dart';
import 'package:ecommerce/data/model/response/AddToWishListResponseDto.dart';
import 'package:ecommerce/data/model/response/BrandesResponseDto.dart';
import 'package:ecommerce/data/model/response/CategoryResponseDto.dart';
import 'package:ecommerce/data/model/response/LoginResponseDto.dart';
import 'package:ecommerce/data/model/response/ProductResponseDto.dart';
import 'package:ecommerce/data/model/response/Register_Rsponse_Dto.dart';
import 'package:ecommerce/data/model/response/RemoveCartItemResponseDto.dart';
import 'package:ecommerce/data/model/response/ResponseCartDto.dart';
import 'package:ecommerce/data/model/response/UpdateCartItemDto.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/ui/utils/Shared_prefrence_utils.dart';
import 'package:http/http.dart' as http;

import '../model/response/GetWihListResponseDto.dart';

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

  Future<Either<Failer, RegisterResponseDto>> register(String Name,
      String Phone, String Email, String Password, String RePassword) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.RegisterUrl);
    var requestBody = RegisterRequest(
        email: Email,
        name: Name,
        password: Password,
        phone: Phone,
        rePassword: RePassword);

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
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

  Future<Either<Failer, LoginResponseDto>> login(
      String Email, String Password) async {
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(Failer(errorMessage: loginResponse.message!));
      }
    }
    return Left(Failer(errorMessage: "Connection Error"));
  }

  Future<Either<Failer, CategoryResponseDto>> getAllCategory() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AllCategoryUrl);
      var response = await http.post(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      var categoryResponse = CategoryResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(Failer(errorMessage: categoryResponse.message!));
      }
    }
    return Left(Failer(errorMessage: "Connection Error"));
  }

  Future<Either<Failer, BrandesResponseDto>> getAllBrandes() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AllBrandesUrl);
      var response = await http.post(url);
      var responseString = response.body.toString();
      var json = jsonDecode(responseString);
      var brandesResponse = BrandesResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandesResponse);
      } else {
        return Left(Failer(errorMessage: brandesResponse.message!));
      }
    }
    return Left(Failer(errorMessage: "Connection Error"));
  }

  Future<Either<Failer, ProductResponseDto>> getAllProduct() async {
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
      } else {
        return Left(Failer(errorMessage: 'Product Response Problem'));
      }
    }
    return Left(Failer(errorMessage: 'Connection Error'));
  }

  Future<Either<Failer, AddToCartResponseDto>> addToCart(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AddToCarUrl);
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var addToCartResponse = AddToCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failer(errorMessage: addToCartResponse.message!));
      } else {
        return Left(Failer(errorMessage: addToCartResponse.message!));
      }
    }
    return Left(Failer(errorMessage: 'Proplem connection '));
  }

  Future<Either<Failer, ResponseCartDto>> getCartItem() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.GetCartItemUrl);
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var getCartItem = ResponseCartDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (getCartItem.data == null || getCartItem.data!.products == null) {
          return Left(Failer(errorMessage: 'Cart is empty'));
        }
        return Right(getCartItem);
      } else if (response.statusCode == 401) {
        return Left(Failer(errorMessage: getCartItem.status ?? 'Unauthorized'));
      } else {
        return Left(
            Failer(errorMessage: getCartItem.status ?? 'Unknown Error'));
      }
    }
    return Left(Failer(errorMessage: 'No internet connection'));
  }

  Future<Either<Failer, RemoveCartItemResponseDto>> deletCartItem(
      String ProductId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
        ApiConstant.baseUrl,
        '${ApiConstant.DeleteCartItem}/$ProductId',
      );
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var deleteCartItem = RemoveCartItemResponseDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (deleteCartItem.data == null ||
            deleteCartItem.data!.products == null) {
          return Left(Failer(errorMessage: 'Cart is empty'));
        }
        print(responsebody);
        return Right(deleteCartItem);
      } else if (response.statusCode == 401) {
        return Left(
            Failer(errorMessage: deleteCartItem.status ?? 'Unauthorized'));
      } else {
        print(responsebody);
        return Left(
            Failer(errorMessage: deleteCartItem.status ?? 'Unknown Error'));
      }
    }
    return Left(Failer(errorMessage: 'No internet connection'));
  }

  Future<Either<Failer, UpdateCartItemDto>> updateCartItem(
      String ProductId, String Count) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
        ApiConstant.baseUrl,
        '${ApiConstant.DeleteCartItem}/$ProductId',
      );
      var token = SharedPrefrenceUtils.getData(key: 'Token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': Count});
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      var updateCartItem = UpdateCartItemDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (updateCartItem.data == null ||
            updateCartItem.data!.products == null) {
          return Left(Failer(errorMessage: 'Cart is empty'));
        }
        return Right(updateCartItem);
      } else if (response.statusCode == 401) {
        return Left(
            Failer(errorMessage: updateCartItem.status ?? 'Unauthorized'));
      } else {
        print(responsebody);
        return Left(
            Failer(errorMessage: updateCartItem.status ?? 'Unknown Error'));
      }
    }
    return Left(Failer(errorMessage: 'No internet connection'));
  }

  Future<Either<Failer, AddToWishListResponseDto>> addToWishList
      (String productId) async {
    var token = SharedPrefrenceUtils.getData(key: 'Token');
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AddToWishList);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.post(url, headers: {
        'token': token.toString(),
      }, body: {
        'productId': productId
      });
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var addtoWishList = AddToWishListResponseDto.fromJson(json);
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        print(addtoWishList.data!.length);

        return Right(addtoWishList);
      } else if (response.statusCode == 401) {
        return Left(Failer(errorMessage: addtoWishList.message!));
      } else {
        print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      }
    }
    return Left(Failer(errorMessage: 'SomeThing Went Wronge'));
  }

  Future<Either<Failer, GetWihListResponseDto>> getWishList() async {
    var token = SharedPrefrenceUtils.getData(key: 'Token');
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.AddToWishList);
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await http.get(url, headers: {
        'token': token.toString(),
      },);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var getWishList = GetWihListResponseDto.fromJson(json);
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        print(getWishList.data!.length);

        return Right(getWishList);
      } else if (response.statusCode == 401) {
        return Left(Failer(errorMessage: 'in valied token'));
      }
    }
    return Left(Failer(errorMessage: 'SomeThing Went Wronge'));
  }
}
