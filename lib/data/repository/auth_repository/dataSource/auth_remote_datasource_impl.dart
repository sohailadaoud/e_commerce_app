import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/dataSource/auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    var response =
        await apiManager.register(name, email, password, rePassword, phone);
    return response;
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
