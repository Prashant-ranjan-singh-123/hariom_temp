import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0/bottom_nav_0_ui.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/bottom_nav_index_0_point_one_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_2/bottom_nav_3_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_2/bottom_nav_3_screen.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';
import '../bottom_nav_index_0/bottom_nav_0_cubit.dart';
import '../bottom_nav_index_0_point_one/bottom_nav_index_0_point_one_ui.dart';
import '../bottom_nav_index_1/bottom_nav_1_cubit.dart';
import '../bottom_nav_index_1/bottom_nav_1_ui.dart';
import 'bottom_nav_navigator_cubit.dart';

class BottomNavBarMain extends StatelessWidget {
  final int initialPage;

  const BottomNavBarMain({super.key, this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit()..updatePage(initialPage),
      child: Scaffold(
        body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return _buildBody(state.currentIndex);
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return _buildBottomNavigationBar(context, state.currentIndex);
          },
        ),
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    if (currentIndex == 0) {
      return BlocProvider(
        create: (context) => BottomNav0Cubit(),
        child: const BottomNav0Ui(),
      );
    } else if (currentIndex == 1) {
      return BlocProvider(
        create: (context) => bottom_nav_index_0_point_one_cubit(),
        child: const bottom_nav_index_0_point_one_ui(),
      );
    } else if (currentIndex == 2) {
      return BlocProvider(
        create: (context) => BottomNav1Cubit(),
        child: const BottomNav1Ui(),
      );
    } else {
      return BlocProvider(
        create: (context) => BottomNav3Cubit(),
        child: const BottomNav3Screen(),
      );
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    const double iconSize = 20.0; // Standard size for all icons

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: MyAppColors.instance().white,
        selectedItemColor: MyAppColors.instance().brand_color,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.exo(),
        unselectedLabelStyle: GoogleFonts.exo(),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_1_inactive,
                height: iconSize,
                width: iconSize,
              ),
            ),
            label: 'Dashboard',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_1_active,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_1_point_2_inactive,
                height: iconSize,
                width: iconSize,
              ),
            ),
            label: 'Task',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_1_point_2_active,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_2_inactive,
                height: iconSize,
                width: iconSize,
              ),
            ),
            label: 'Attendance',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_2_active,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_3_inactive,
                height: iconSize,
                width: iconSize,
              ),
            ),
            label: 'Profile',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MyAppAssets.instance().svg_bottom_nav_3_active,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
        ],
        onTap: (page) {
          context.read<BottomNavBarCubit>().updatePage(page);
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
