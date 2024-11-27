import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/calender/calender_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/calender/calender_ui.dart';
import 'bottom_nav_index_0_point_one_state.dart';

class bottom_nav_index_0_point_one_cubit extends Cubit<bottom_nav_index_0_point_one_state> {
  bottom_nav_index_0_point_one_cubit() : super(const bottom_nav_index_0_point_one_state());

  void go_to_calander({required BuildContext context, required int index}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => CalenderCubit(),
          child: CalenderUi(index: index,),
        )));
  }


}
