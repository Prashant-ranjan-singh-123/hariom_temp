import 'package:flutter/material.dart';

import '../../../reusable/app_bar_custom.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';

class NotificationScreenUi extends StatelessWidget {
  const NotificationScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: Column(
            children: [
              AppBarCustom(title: "Notification", isNotificationScreen: true,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(MyAppAssets.instance().png_notification),
              ),
            ],
          ),
      ),
    );
  }

  Widget _active_notification(){
    return SizedBox();
  }

  Widget _in_active_notification(){
    return SizedBox();
  }
}
