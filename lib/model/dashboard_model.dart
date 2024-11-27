import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/main.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/bottom_nav_index_0_point_one_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/bottom_nav_index_0_point_one_ui.dart';
import 'package:hariom/screens/after_login/bottom_nav_navigator/bottom_nav_navigator_cubit.dart';

class DashBoardModel {
  int num;
  String name;
  Color color;
  Function(BuildContext context) fun;

  DashBoardModel({
    required this.num,
    required this.name,
    required this.color,
    required this.fun,
  });
}

List<DashBoardModel> DashBoardModelList = [
  DashBoardModel(
      num: 1, name: 'Active Task', color: Colors.blue, fun: (context) {
        context.read<BottomNavBarCubit>().under_dev(context: context);
  }),
  DashBoardModel(
      num: 2440, name: 'Complete Task', color: Colors.green, fun: (context) {
    context.read<BottomNavBarCubit>().under_dev(context: context);
  }),
  DashBoardModel(
      num: 18, name: 'Pending Task', color: Colors.yellow, fun: (context) {
    context.read<BottomNavBarCubit>().under_dev(context: context);
  }),
  DashBoardModel(
      num: 64, name: 'Overdue Task', color: Colors.red, fun: (context) {
    context.read<BottomNavBarCubit>().under_dev(context: context);
  }),
  DashBoardModel(
      num: 46,
      name: 'Allocated Task',
      color: Colors.purple,
      fun: (context) {
        context.read<BottomNavBarCubit>().updatePage(1);
      }),
  DashBoardModel(
    num: 39,
    name: 'Attendance',
    color: Colors.deepPurple,
    fun: (context) {
      context.read<BottomNavBarCubit>().updatePage(2);
    },
  ),
];
