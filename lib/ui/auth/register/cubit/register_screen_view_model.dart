import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel() : super(RegisterInitialState());

  void register() {}
}
