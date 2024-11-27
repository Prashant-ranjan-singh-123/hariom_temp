import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hariom/utils/app_dialog.dart';
import 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderState(focus_date: DateTime.now()));

  void change_date({required DateTime time}) {
    emit(state.copyWith(focus_date: time));
  }

  void save_button({required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Construction',
        content: 'This Feature is under construction.', onActionPressed: (){
          Navigator.of(context).pop();
    });
  }
}
