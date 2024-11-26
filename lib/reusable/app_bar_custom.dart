import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class AppBarCustom extends StatelessWidget {
  String title;
  Icon? icon;
  bool isHomeScreen;
  bool isProfileScreen;
  AppBarCustom(
      {super.key,
        required this.title,
        this.icon,
        this.isHomeScreen = false,
        this.isProfileScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05,
              vertical: 12),
          child: _home_screen_app_bar(context: context)
        ),
      ),
    );
  }

  Widget _home_screen_app_bar({required BuildContext context}) {
    return Row(
      children: [
        Text(title,style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w400,
        ),),
        Spacer(),
        Align(
          alignment:
          Alignment.centerRight, // Align the CircleAvatar to the right
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                  // MaterialPageRoute(
                  //   builder: (context) => BlocProvider(
                  //     create: (context) => ProfileScreenCubit(),
                  //     child:
                  //     ProfileScreenUi(), // Replace SizedBox with your target screen widget
                  //   ),
                  // ),
                // );
              },
              icon: icon == null
                  ? const Icon(Icons.notifications, color: Colors.black,)
                  : icon!,
              color: Colors.white, // Color for the icon
              highlightColor: Colors.white.withOpacity(0.2),
              splashColor: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
