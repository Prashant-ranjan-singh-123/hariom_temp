import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hariom/utils/app_dialog.dart';

import 'bottom_nav_1_state.dart';

class BottomNav1Cubit extends Cubit<BottomNav1State> {
  BottomNav1Cubit()
      : super(BottomNav1State(is_check_in_tab_check_in_button_clicked: false));

  void check_in_tab_check_in_button_clicked({required BuildContext context}) {
    emit(state.copyWith(is_check_in_tab_check_in_button_clicked: true));
    AppDialog.instance().confDialog(
        context: context,
        title: 'Confirm',
        content: 'Are you sure you want to proceed?',
        onActionPressed: () {

        });
  }

  void check_in_tab_check_in_button_released() {
    print('here');
    emit(state.copyWith(is_check_in_tab_check_in_button_clicked: false));
  }
}
