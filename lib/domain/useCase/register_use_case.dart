import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_app/data/repository/auth_repository/repository/auth_repositpory_impl.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<RegisterResponse> invoke(String name, String email, String password,
      String rePassword, String phone) {
    return authRepositoryContract.register(
        name, email, password, rePassword, phone);
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepositoryContract: injectionAuthRepository());
}
