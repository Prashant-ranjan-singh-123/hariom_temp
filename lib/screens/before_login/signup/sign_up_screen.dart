import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/main.dart';
import 'package:hariom/screens/before_login/login/login_cubit.dart';
import 'package:hariom/screens/before_login/signup/sign_up_cubit.dart';
import 'package:hariom/utils/app_assets.dart';
import 'package:hariom/utils/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  late double width, height;
  late SignUpCubit cubit;
  late TextEditingController email, pass, conf_pass, name;

  @override
  void initState() {
    cubit = context.read<SignUpCubit>();
    email = TextEditingController();
    pass = TextEditingController();
    conf_pass = TextEditingController();
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    conf_pass.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: MyAppColors.instance().white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                _top_image(),
                SizedBox(
                  height: height * 0.05,
                ),
                _sign_up_text(),
                SizedBox(
                  height: height * 0.05,
                ),
                _form()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _top_image() {
    return SizedBox(
        width: width * 0.4,
        child: Image.asset(MyAppAssets.instance().png_logo));
  }

  Widget _sign_up_text() {
    return Text(
      'SIGN UP',
      textAlign: TextAlign.center,
      style: GoogleFonts.exo(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _form() {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text_field(heading: 'Full Name', label: 'Name', controller: name),
            SizedBox(
              height: 12,
            ),
            _text_field(
                heading: 'Email or Phone Number',
                label: 'Email/Number',
                controller: email),
            SizedBox(
              height: 12,
            ),
            _text_field(
                heading: 'Password', label: 'Password', controller: pass),
            SizedBox(
              height: 12,
            ),
            _text_field(
                heading: 'Confirm Password',
                label: 'Confirm Password',
                controller: pass),
            SizedBox(
              height: height * 0.03,
            ),
            sign_up_button(),
            const SizedBox(
              height: 12,
            ),
            _sign_in()
          ],
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
          style: TextStyle(
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

  Widget forgot_pass() {
    return Row(
      children: [
        Spacer(),
        Text(
          'Forgot Password?',
          textAlign: TextAlign.left,
          style: GoogleFonts.exo(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget sign_up_button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<SignUpCubit>().sign_up_logic(
                context: context,
              );
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
          'Sign Up',
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

  Widget _sign_in() {
    return SizedBox(
      width: 347,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Do not have an account?',
              style: GoogleFonts.exo(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' ',
              style: GoogleFonts.exo(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
                text: 'SIGN IN',
                style: GoogleFonts.exo(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.read<SignUpCubit>().sign_in_button(
                          context: context,
                        );
                  }),
          ],
        ),
      ),
    );
  }
}
