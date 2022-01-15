import 'package:mobile_component/src/logic/bloc/app_bloc.dart';
import 'package:mobile_component/src/logic/bloc/forgot_pass_bloc.dart';
import 'package:mobile_component/src/logic/bloc/login_bloc.dart';
import 'package:mobile_component/src/logic/bloc/register_bloc.dart';

class ProviderBlocs {
  RegisterBloc register = RegisterBloc();
  LoginBloc login = LoginBloc();
  ForgotPassBloc forgotPass = ForgotPassBloc();
  AppBloc appBloc = AppBloc();
}
