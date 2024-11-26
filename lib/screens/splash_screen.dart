import 'package:flutter/material.dart';
import 'package:hariom/services/login_check/login_check_screen.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _page_change() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (a, b, c) => const LoginCheckScreen(),
          transitionDuration: const Duration(seconds: 0)));
    });
  }

  @override
  void initState() {
    super.initState();
    _page_change();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: Center(
        child: Center(child: Image.asset(MyAppAssets.instance().png_logo)),
      ),
    );
  }
}
