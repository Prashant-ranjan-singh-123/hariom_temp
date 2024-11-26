import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hariom/services/login_check/login_check_screen.dart';
import 'package:hariom/services/shared_pref/shared_pref_logic.dart';
import 'package:hariom/utils/add_utils.dart';
import 'package:hariom/utils/app_dialog.dart';

import 'bottom_nav_3_state.dart';

class BottomNav3Cubit extends Cubit<BottomNav3State> {
  BottomNav3Cubit() : super(const BottomNav3State());

  Future<void> log_out({required BuildContext context}) async {
    AppDialog.instance().confDialog(
        context: context,
        title: 'Confirm Logout',
        content: 'Are you sure you want to log out?',
        onActionPressed: () async {
          await SharedPreferenceLogic.setLoginFalse();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginCheckScreen()),
              (Route<dynamic> route) => false);
        });
  }

  Future<void> save({required BuildContext context}) async {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Development',
        content: 'This Feature is under development.');
  }
}
