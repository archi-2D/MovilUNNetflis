import 'package:mobile_component/src/logic/bloc/register_bloc.dart';

class RegisterLogic {
  cleanRegisterBolc(RegisterBloc registerBloc) {
    registerBloc.changeName('');
    registerBloc.changeUserName('');
    registerBloc.changeEmail('');
    registerBloc.changePhoneNumber('');
    registerBloc.changePassword('');
    registerBloc.changeConfirmPassword('');
  }
}
