import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone);
}
