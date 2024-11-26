import 'package:bloc/bloc.dart';

import '../shared_pref/shared_pref_logic.dart';
import 'login_check_state.dart';

class LoginCheckCubit extends Cubit<LoginCheckState> {
  LoginCheckCubit() : super(LoginCheckState(true, false));

  Future<void> token_check_logic() async {
    // await SharedPreferenceLogic.setLoginFalse();
    // await SharedPreferenceLogic.setLoginTrue();
    bool is_login = await SharedPreferenceLogic.isLogIn();
    if(is_login){
      emit(state.copyWith(loading: false, is_token: true));
    }else{
      emit(state.copyWith(loading: false, is_token: false));
    }
  }
}
