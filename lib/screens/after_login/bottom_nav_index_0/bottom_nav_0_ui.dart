import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/utils/app_color.dart';

import '../../../model/dashboard_model.dart';
import '../../../reusable/app_bar_custom.dart';

class BottomNav0Ui extends StatelessWidget {
  const BottomNav0Ui({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              AppBarCustom(title: "Dashboard"),
              Expanded(
                child: _grid_view(context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _grid_view({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // Two columns
        mainAxisSpacing: 16, // Spacing between rows
        crossAxisSpacing: 16, // Spacing between columns
        childAspectRatio: 2 / 1.3, // Aspect ratio of 2:1
        children: DashBoardModelList.map((dashboardItem) {
          return GestureDetector(
            onTap: (){
              dashboardItem.fun(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x28000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${dashboardItem.num}', // Use num from DashBoardModel
                    style: GoogleFonts.exo(
                      color: dashboardItem.color,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dashboardItem.name, // Use name from DashBoardModel
                    style: GoogleFonts.exo(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(), // Convert map result to a list
      ),
    );
  }

}
