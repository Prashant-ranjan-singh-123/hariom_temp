import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/reusable/circular_progress_indicator.dart';
import 'package:hariom/screens/before_login/login/login_cubit.dart';
import 'package:hariom/screens/before_login/login/login_screen.dart';
import 'package:hariom/services/login_check/login_check_cubit.dart';
import 'package:hariom/utils/app_color.dart';

import '../../screens/after_login/bottom_nav_navigator/bottom_nav_navigator_ui.dart';
import 'login_check_state.dart';

class LoginCheckScreen extends StatefulWidget {
  const LoginCheckScreen({super.key});

  @override
  State<LoginCheckScreen> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheckScreen> {
  @override
  void initState() {
    context.read<LoginCheckCubit>().token_check_logic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: BlocBuilder<LoginCheckCubit, LoginCheckState>(
        builder: (context, state) {
          bool loading = state.loading;
          bool? isToken = state.is_token;
          if (loading || isToken == null) {
            return _loading();
          } else if (isToken) {
            return _token();
          } else {
            return _no_token();
          }
        },
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: MyAppCircularProgressIndicator(),
    );
  }

  Widget _token() {
    return const BottomNavBarMain();
  }

  Widget _no_token() {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginScreen(),
    );
  }
}
