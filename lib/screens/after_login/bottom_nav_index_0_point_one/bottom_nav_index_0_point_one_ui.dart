import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/main.dart';
import 'package:hariom/model/allocated_task_model.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/bottom_nav_index_0_point_one_cubit.dart';

import '../../../reusable/app_bar_custom.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../bottom_nav_navigator/bottom_nav_navigator_cubit.dart';

class bottom_nav_index_0_point_one_ui extends StatelessWidget {
  const bottom_nav_index_0_point_one_ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(
              title: "Allocated Tasks",
              // isNotificationScreen: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BottomNavBarCubit>()
                              .under_dev(context: context);
                        },
                        child: SvgPicture.asset(
                            MyAppAssets.instance().svg_allocated_task_top),
                      ),
                      const SizedBox(height: 20), // Adjust spacing as needed
                      _cards(num: 0, context: context),
                      const SizedBox(height: 20),
                      _cards(num: 1, context: context),
                      const SizedBox(height: 20),
                      _cards(num: 2, context: context),
                      const SizedBox(height: 20),
                      _cards(num: 3, context: context),
                      const SizedBox(height: 20),
                      _cards(num: 4, context: context),
                      const SizedBox(height: 20),
                      // Add more widgets or cards here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cards({required int num, required BuildContext context}) {
    return GestureDetector(
      onTap: (){
        context
            .read<bottom_nav_index_0_point_one_cubit>()
            .go_to_calander(context: context, index: num);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x47000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: MyAppColors.instance().brand_color,
                child: Text(
                  listAllocatedTaskModel[num].charcater,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listAllocatedTaskModel[num].designisation,
                      style: GoogleFonts.exo(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      listAllocatedTaskModel[num].description,
                      style: GoogleFonts.exo(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
