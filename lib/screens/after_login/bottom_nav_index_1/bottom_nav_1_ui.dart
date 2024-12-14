import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';

import '../../../model/dashboard_model.dart';
import '../../../reusable/app_bar_custom.dart';
import 'check_in/check_in_ui.dart';
import 'check_out/check_out_ui.dart';
import 'overview/overview_ui.dart';

class BottomNav1Ui extends StatelessWidget {
  const BottomNav1Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: MyAppColors.instance().white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                AppBarCustom(title: "Attendance"),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: ButtonsTabBar(
                    // Customize the appearance and behavior of the tab bar
                    physics: PageScrollPhysics(),
                    // center: true,
                    contentCenter: true,
                    backgroundColor: MyAppColors.instance().brand_color,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    borderWidth: 0,
                    borderColor: Colors.black,
                    unselectedBackgroundColor: const Color.fromRGBO(235, 235, 235, 1),
                    buttonMargin: EdgeInsets.zero,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    // Add your tabs here
                    tabs: const [Tab(
                      // icon: Icon(Icons.import_contacts),
                      text: 'Overview',
                    ),
                      Tab(
                        // icon: Icon(Icons.add),
                        text: 'Check In',
                      ),
                      Tab(
                        // icon: Icon(Icons.add),
                        text: 'Check Out',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      // First tab view: GridView
                      OverviewUi(),

                      // SizedBox(),
                      //
                      // SizedBox()
                      // Second tab view: Placeholder or additional UI
                      CheckInUi(),

                      CheckOutUi()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
