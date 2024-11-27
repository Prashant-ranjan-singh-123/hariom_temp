import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hariom/model/allocated_task_model.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/calender/calender_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_0_point_one/calender/calender_state.dart';
import 'package:hariom/screens/after_login/bottom_nav_index_1/bottom_nav_1_cubit.dart';
import 'package:hariom/screens/after_login/bottom_nav_navigator/bottom_nav_navigator_cubit.dart';

import '../../../../reusable/app_bar_custom.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';

class CalenderUi extends StatefulWidget {
  int index;
  CalenderUi({super.key, required this.index});

  @override
  State<CalenderUi> createState() => _CalenderUiState();
}

class _CalenderUiState extends State<CalenderUi> {
  late TextEditingController description, assignment, remember;

  @override
  void initState() {
    description = TextEditingController(
        text: listAllocatedTaskModel[widget.index].description);
    assignment = TextEditingController(
        text: listAllocatedTaskModel[widget.index].assignment);
    remember = TextEditingController(
        text: listAllocatedTaskModel[widget.index].reminder);
    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    assignment.dispose();
    remember.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(
              title: "Calendar",
              isNotificationScreen: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30), // Adjust spacing as needed
                      BlocBuilder<CalenderCubit, CalenderState>(
                        builder: (context, state) {
                          // Get the current focused date from the state
                          final focusedDate = state.focus_date;

                          return Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: MyAppColors.instance()
                                  .brand_color, // Primary color for the reddish theme
                              colorScheme: ColorScheme.light(
                                primary: MyAppColors.instance()
                                    .brand_color, // Main accent color
                                onPrimary: Colors
                                    .white, // Text/icon color on primary background
                                secondary: MyAppColors.instance()
                                    .brand_color, // For highlights or secondary elements
                              ),
                            ),
                            child: EasyDateTimeLinePicker(
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030, 3, 18),
                              focusedDate:
                                  focusedDate, // Use the state value to show the selected date
                              onDateChange: (selectedDate) {
                                // Update the focused date in the cubit
                                context
                                    .read<CalenderCubit>()
                                    .change_date(time: selectedDate);
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40), // Adjust spacing as needed
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BottomNavBarCubit>()
                              .under_dev(context: context);
                        },
                        child: _make_card(
                            assetPath: MyAppAssets.instance().svg_calender_mid,
                            context: context),
                      ),
                      const SizedBox(height: 40),
                      _text_field(
                          label: 'Description',
                          controller: description,
                          minLine: 5),
                      const SizedBox(height: 20),
                      _text_field(
                          label: 'Assignment',
                          controller: assignment,
                          minLine: 5),
                      const SizedBox(height: 20),
                      _text_field(
                          label: 'Remember', controller: remember, minLine: 5),
                      const SizedBox(height: 30), // Adjust spacing as needed
                      save_button(),
                      const SizedBox(height: 30), // Adjust spacing as needed
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

  Widget _make_card(
      {required String assetPath, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        // context.read<AlocatedTaskCubit>().go_to_calander(context: context);
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
          child: SvgPicture.asset(assetPath)),
    );
  }

  Widget _text_field(
      {required String label,
      required TextEditingController controller,
      int minLine = 1}) {
    return Container(
      width: double.infinity,
      // height: 48,
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: TextField(
          controller: controller,
          minLines: minLine,
          maxLines: minLine,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: InputBorder.none,
            hintText: label,
            labelText: label,
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(color: Colors.grey),
          ),
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget save_button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<CalenderCubit>().save_button(context: context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF7E22), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          padding: const EdgeInsets.all(10), // Padding inside the button
          elevation: 0, // Removes button elevation to match the flat look
          // minimumSize: const Size(347, 44), // Sets the button size
        ),
        child: const Text(
          'Save',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w700,
            height: 1.2, // Adjusted for proper text spacing
          ),
        ),
      ),
    );
  }
}
