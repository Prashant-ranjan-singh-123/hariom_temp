import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0/bottom_nav_0_ui.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_2/bottom_nav_3_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_2/bottom_nav_3_screen.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';

import '../bottom_nav_index_0/bottom_nav_0_cubit.dart';
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
      return SizedBox();
    } else {
      return BlocProvider(
        create: (context) => BottomNav3Cubit(),
        child: const BottomNav3Screen(),
      );
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: MyAppColors.instance().white,
        selectedItemColor: MyAppColors.instance().brand_color,
        selectedLabelStyle: GoogleFonts.exo(),
        unselectedLabelStyle: GoogleFonts.exo(),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    MyAppAssets.instance().svg_bottom_nav_1_inactive),
              ),
              label: 'Dashboard',
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    MyAppAssets.instance().svg_bottom_nav_1_active),
              )),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  MyAppAssets.instance().svg_bottom_nav_2_inactive),
            ),
            label: 'Attendance',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  MyAppAssets.instance().svg_bottom_nav_2_active),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  MyAppAssets.instance().svg_bottom_nav_3_inactive),
            ),
            label: 'Profile',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  MyAppAssets.instance().svg_bottom_nav_3_active),
            ),
          ),
        ],
        onTap: (page) {
          context.read<BottomNavBarCubit>().updatePage(page);
        },
        currentIndex:
            currentIndex, // Make sure this is reading from the updated state
      ),
    );
  }
}
