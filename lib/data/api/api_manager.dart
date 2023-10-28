import 'dart:convert';

import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerUrl);
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    var response = await http.post(url, body: requestBody.toJson());

    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
}
