import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/api/failures.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/CategoryResponseDto.dart';
import 'package:e_commerce_app/data/model/response/LoginResponse.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

import '../model/request/LoginRequest.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  /* https://ecommerce.routemisr.com/api/v1/auth/signup  */
  Future<Either<Failures, RegisterResponse>> register(String name, String email,
      String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerUrl);
      var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(Failures(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'please check your internet'));
    }
  }

  Future<Either<Failures, LoginResponse>> login(
      String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.loginrUrl);
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );

      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(Failures(errorMessage: loginResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'please check your internet'));
    }
  }

  Future<Either<Failures, CategoryResponseDto>> getCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.getAllCategoriesUrl);
      var response = await http.get(
        url,
      );
      var categoryResponse =
          CategoryResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return Left(NetworkError(errorMessage: 'please check your internet'));
    }
  }
}
