import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_down_button/pull_down_button.dart';
import '../screens/after_login/bottom_nav_index_2/bottom_nav_3_cubit.dart';
import '../screens/after_login/notification_screen/notification_screen_ui.dart';

class AppBarCustom extends StatelessWidget {
  String title;
  Icon? icon;
  bool isHomeScreen;
  bool isNotificationScreen;
  bool isHideNotification;
  AppBarCustom(
      {super.key,
      required this.title,
      this.icon,
      this.isHomeScreen = false,
      this.isNotificationScreen = false,
      this.isHideNotification = false});

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
            child: _home_screen_app_bar(context: context)),
      ),
    );
  }

  Widget _home_screen_app_bar({required BuildContext context}) {
    return Row(
      children: [
        isNotificationScreen
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))
            : const SizedBox(),
        Text(
          title,
          style: GoogleFonts.exo(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Align(
          alignment:
              Alignment.centerRight, // Align the CircleAvatar to the right
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: isHideNotification
                ? PullDownButton(
                    position: PullDownMenuPosition.over,
                    itemBuilder: (context) => [
                      PullDownMenuItem(
                        icon: Icons.logout,
                        title: 'Log Out',
                        onTap: () {
                          context
                              .read<BottomNav3Cubit>()
                              .log_out(context: context);
                        },
                      ),
                    ],
                    buttonBuilder: (context, showMenu) => CupertinoButton(
                      onPressed: showMenu,
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  )
                : isNotificationScreen
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationScreenUi()));
                        },
                        icon: icon == null
                            ? const Icon(
                                Icons.notifications_none,
                                color: Colors.black,
                              )
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
