import 'package:flutter/material.dart';
import 'package:hariom/screens/after_login/bottom_nav_navigator/bottom_nav_navigator_cubit.dart';
import 'package:hariom/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/services/login_check/login_check_cubit.dart';
import 'package:hariom/utils/app_color.dart';

void main() => runApp(const HariomApp());

class HariomApp extends StatelessWidget {
  const HariomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCheckCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: MyAppColors.instance().white
        ),
      ),
    );
  }
}
