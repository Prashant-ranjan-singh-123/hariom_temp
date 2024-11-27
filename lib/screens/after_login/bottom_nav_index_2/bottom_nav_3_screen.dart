import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hariom/main.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';

import '../../../reusable/app_bar_custom.dart';
import '../bottom_nav_navigator/bottom_nav_navigator_cubit.dart';
import 'bottom_nav_3_cubit.dart';

class BottomNav3Screen extends StatefulWidget {
  const BottomNav3Screen({super.key});

  @override
  State<BottomNav3Screen> createState() => _BottomNav3ScreenState();
}

class _BottomNav3ScreenState extends State<BottomNav3Screen> {
  late double width, height;
  late BottomNav3Cubit cubit;
  late TextEditingController employee_id, name, design, mail, phone;

  @override
  void initState() {
    cubit = context.read<BottomNav3Cubit>();
    employee_id = TextEditingController(text: '4321907');
    name = TextEditingController(text: 'Prashant Singh');
    design = TextEditingController(text: 'Programmer');
    mail = TextEditingController(text: 'prashant@veramasa.com');
    phone = TextEditingController(text: '9876543210');
    super.initState();
  }

  @override
  void dispose() {
    employee_id.dispose();
    name.dispose();
    design.dispose();
    mail.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              AppBarCustom(
                title: "Profile",
                isHideNotification: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Image.asset(MyAppAssets.instance().png_profile_image),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        _text_field(
                            heading: 'Employee Id',
                            label: 'Employee Id',
                            controller: employee_id),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _text_field(
                            heading: 'Full Name',
                            label: 'Name',
                            controller: name),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _text_field(
                            heading: 'Designation',
                            label: 'Designation',
                            controller: design),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _text_field(
                            heading: 'Email Id',
                            label: 'Email Id',
                            controller: mail),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _text_field(
                            heading: 'Phone Number',
                            label: 'Phone Number',
                            controller: phone),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        save_button(),
                        // SizedBox(
                        //   height: height * 0.03,
                        // ),
                        // log_out_button(),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text_field(
      {required String heading,
      required String label,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
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
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              controller: controller,
              enabled: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
                hintText: label,
                // labelText: label,
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        )
      ],
    );
  }

  Widget save_button() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          cubit.save(context: context);
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

  Widget log_out_button() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        onPressed: () {
          cubit.log_out(context: context);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: MyAppColors.instance().brand_color), // Set border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          padding: const EdgeInsets.all(10), // Padding inside the button
          elevation: 0, // Removes button elevation for a flat look
        ),
        child: const Text(
          'Log Out',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
