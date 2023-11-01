import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_app/data/repository/auth_repository/dataSource/auth_remote_datasource_impl.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/dataSource/auth_remote_datasource.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }
}

AuthRepositoryContract injectionAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}
