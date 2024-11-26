import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_dialog.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void sign_up_logic(
      {required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Development',
        content: 'This Feature is Under Development.');
  }

  void sign_in_button(
      {required BuildContext context}) {
    Navigator.pop(context);
  }
}
