import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/screens/after_login/bottom_nav_navigator/bottom_nav_navigator_ui.dart';
import 'package:hariom/screens/before_login/signup/sign_up_cubit.dart';
import 'package:hariom/screens/before_login/signup/sign_up_screen.dart';
import 'package:hariom/services/shared_pref/shared_pref_logic.dart';
import 'package:hariom/utils/add_utils.dart';
import '../../../utils/app_dialog.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void sign_up_screen({required BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignUpScreen(),
            )));
  }

  void forgot_pass_screen({required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Construction',
        content: 'This feature is under construction.');
  }

  void sign_in_screen(
      {required BuildContext context,
      required String email,
      required String pass}) {
    if (email == 'hariom@gmail.com' && pass == '1234567890') {
      AppDialog.instance().confDialog(
          context: context,
          title: 'Login',
          content: 'Are you sure you want to login',
          onActionPressed: () async {
            await SharedPreferenceLogic.setLoginTrue(email: 'hariom@gmail.com');
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const BottomNavBarMain()),
                (Route<dynamic> route) => false);
          });
    } else {
      AppDialog.instance().infoDialog(
          context: context,
          title: 'Correct Credentials',
          content: '1) Email: hariom@gmail.com\n2) Pass: 1234567890');
    }
  }
}
